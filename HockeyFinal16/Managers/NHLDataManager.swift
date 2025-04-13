//
//  NHLDataManager.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/12/25.
//

import Foundation
import SwiftUI


// See https://www.donnywals.com/comparing-observable-to-observableobjects/
// @Observable // iOS 17.0 or newer
class NHLDataManager : ObservableObject {
    
    // TODO: Fix this.
    // A default data set might be needed, but we should be able to download it.
    static var defaultBracket: Bracket = Bundle.main.decode("playoffs2024.json")
    
    // @Published var bracket: Bracket
    @Published var bracketBucket: [Bracket] = [NHLDataManager.defaultBracket]
    
    @MainActor
    func loadBracket( year: String ) async {
        let targetUrl = "https://api-web.nhle.com/v1/playoff-bracket/\(year)"
        // print( "NHLDataManager loadBracket: targetUrl: \(targetUrl)" )
        
        let httpService = HttpService<Bracket>( urlString: targetUrl )
        do {
            let bracket: Bracket = try await httpService.getJSON(isJSONArray: false)
            bracketBucket[0] = bracket
        }
        catch {
            if( error.localizedDescription.contains( "cancelled" ) ) {
                // Not a true retrieval error, a routine task cancellation
                print( "NHLDataManager: Data task cancelled: \(error)" );
            }
            else {
                print( "NHLDataManager: Could not retrieve bracket data: \(error)" );
            }
            bracketBucket[0] = NHLDataManager.defaultBracket
        }
    }
}
