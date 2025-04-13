//
//  HttpService.swift
//  DivIncome
//
//  Created by Kevin Filer on 8/21/22.
//

import Foundation
import SwiftUI

/*
 Generic HTTP service that will handle any data type.
 */
struct HttpService<T: Codable> {
    
    let urlString: String

    /*
     Returns the populated model object based on the decoded JSON data retrieved from the URL.
     The default decoding strategy values are the usual Swift defaults.
     Important: For the NHL api, most returned JSON is a large object (vice array).
     */
    @MainActor
    func getJSON( isJSONArray: Bool = false,
                  dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                  keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys ) async throws -> T {
        //  Verify the URL
        guard let url = URL( string: urlString ) else {
            throw APIError.invalidURL
        }
        
        do {
            //  Make the call to the URL with the request.
            let (data, response) = try await URLSession.shared.data( from: url )
            
            //  Verify that the response is valid and the status code is not an error.
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode >= 200 && httpResponse.statusCode < 300
            else {
                throw APIError.invalidResponseStatus
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            
            // Decode the JSON and return the populated model object.  Need to know if the
            // downloaded JSON is an array.
            do {
                if isJSONArray {
                    let decoded = try decoder.decode( [T].self, from: data )
                    if decoded.isEmpty {
                        // Some mutual funds may not have profile data.
                        throw APIError.missingData
                    }
                    return decoded[0]
                }
                else {
                    let decoded = try decoder.decode( T.self, from: data )
                    return decoded
                }
            }
            catch {
                throw APIError.decodingError( error.localizedDescription )
            }
        }
        catch {
            var msg = "";
            if let error = error as NSError?,
                    error.domain == NSURLErrorDomain && error.code == NSURLErrorCancelled {
                // Not a true error condition, a view was refreshed so previous task was cancelled.
                msg = "The retrieval task was cancelled (not necessarily an error)"
            }
            else {
                 msg = error.localizedDescription
            }
            throw APIError.dataTaskError( msg )
        }
    }
}

enum APIError: Error, LocalizedError
{
    case invalidURL
    case invalidResponseStatus
    case dataTaskError( String )
    case corruptData
    case missingData
    case decodingError( String )

    var errorDescription: String? {
        switch self
        {
            case .invalidURL:
                return NSLocalizedString("The endpoint URL is invalid", comment: "")
            case .invalidResponseStatus:
                return NSLocalizedString("The API failed to issue a valid response.", comment: "")
            case let .dataTaskError( string ):
                return string
            case .corruptData:
                return NSLocalizedString("The data provided appears to be corrupt", comment: "")
            case .missingData:
                return NSLocalizedString("No data was returned", comment: "")
            case let .decodingError( string ):
                return string
        }
    }
}
