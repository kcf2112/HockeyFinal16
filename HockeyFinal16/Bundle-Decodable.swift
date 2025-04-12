//
//  Bundle-Decodable.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/10/25.
//
// Ref: https://www.hackingwithswift.com/books/ios-swiftui/loading-a-specific-kind-of-codable-data
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let fileUrl = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: fileUrl) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
