//
//  HockeyFinal16App.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/3/25.
//

import SwiftUI

@main
struct HockeyFinal16App: App {
    @State private var nhlData = NHLDataManager()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(nhlData)
        }
    }
}
