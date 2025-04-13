//
//  ContentView.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/3/25.
//
// TODO:
// - Find a free NHL playoff data feed; possibilities:
//   -- NHL api docs: https://github.com/Zmalski/NHL-API-Reference
//      --- NHL api is free
//      --- Another api doc: https://gitlab.com/dword4/nhlapi/-/blob/master/new-api.md
//
//   -- https://developer.sportradar.com/ice-hockey/reference/nhl-overview
//      --- fWCoFBhauGyUnNAtBt7nyurWgUnfOTvCbwR6X9aT
//      --- Password: Sportradar1992
//      --- Key is good for 30 days
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Lead with bracket view.
        // TODO: Need some other welcome screen?
        PlayoffBracketView()
    }
}

#Preview {
    ContentView()
}
