//
//  GameSummary.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/17/25.
//
// Data source URLs:
// https://api-web.nhle.com/v1/gamecenter/2023030111/boxscore
// https://api-web.nhle.com/v1/gamecenter/2023030111/landing
// https://api-web.nhle.com/v1/wsc/game-story/2023030111
//

import SwiftUI

// Shows a summary of the specified playoff game.
//
struct GameSummaryView: View {
    let gameID: Int
    
    @Environment(NHLDataManager.self) private var nhlData
    @State private var isLoading = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack() {
                Text("Game Summary")
                Text("gameStory date: \(nhlData.gameStory.gameDate)")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            // .border(.red)
            Spacer()
            VStack {
                HStack {
                    Text("Scoring").font(.title3)
                    Spacer()
                }
                ScoringReportView()
                // Text("Shots on Goal (?)")
                // Text("Goalies (saves?)")
                // Text("Penalties")
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            // .border(.green)
            .padding(6)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        // .border(.blue)
        .task {
            await nhlData.loadBoxScore(gameID: gameID)
            await nhlData.loadGameStory(gameID: gameID)
        }
    }
}
