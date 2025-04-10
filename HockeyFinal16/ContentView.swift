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
// - Each pairing represents a series played by two teams in the bracket
//   -- When tapped, a pairing opens a view to show info about the series.
//   -- BracketPairView struct displays available data about all pairings.
// - Combine team logos with team names (if space permits.)
// - Add series results (games won for each team) alongside the team abbreviations.
//

import SwiftUI

let bracketSeriesWidth = 75.0

struct BracketPairView: View {
    let pair: SeriesPair
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.blue)
                .frame(width: bracketSeriesWidth, height: 65)
            VStack {
                Text(pair.team1)
                    .foregroundStyle(.white)
                Divider()
                    .frame(width: 80)
                    .overlay(.white)
                Text(pair.team2)
                    .foregroundStyle(.white)
            }
        }
    }
}

// This screen lays out shape and text components to depict a
// playoff bracket.
//
// See Models/Bracket.swift for info about the data.
//
struct ContentView: View {
    let bracketData = Bundle.main.decode("playoffs2024.json")

    var body: some View {
        // Text("TEST: series obj 0: " + String(bracketData.series[0].seriesURL))
        VStack {
            Spacer()
            HStack(spacing: 15) {
                // Final 16, Eastern Conference group.
                BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[0]))
                BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[1]))
                BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[2]))
                BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[3]))
            }
            Spacer()
            HStack(spacing: 90) {
                // Quarterfinals.
                BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[8]))
                BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[9]))

            }
            Spacer()
            Text("Eastern Conference")
                .frame(width: .infinity)
            Spacer()
            HStack {
                // Semifinals: Eastern Conference finals.
                BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[12]))
            }
            Spacer()
            HStack() {
                // Finals: Stanley Cup series.
                // TODO: Add decoration to highlight this pairing.
                // Text("Stanley Cup")
                // Spacer()
                BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[14]))
                // Spacer()
                // Text("Finals")
                // Spacer()
            }
            .frame(minWidth: 1, maxWidth: .infinity )
            .padding(4)
            .background(.yellow)
            Spacer()
            HStack {
                // Semifinals: Western Conference finals.
                BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[13]))
            }
            Spacer()
            Text("Western Conference")
            Spacer()
            HStack(spacing: 90) {
                // Quarterfinals.
                BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[10]))
                BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[11]))

            }
            Spacer()
            HStack(spacing: 15) {
                // Final 16, Western Conference group.
                BracketPairView(pair: SeriesPair(fromSeries:bracketData.series[4]))
                BracketPairView(pair: SeriesPair(fromSeries:bracketData.series[5]))
                BracketPairView(pair: SeriesPair(fromSeries:bracketData.series[6]))
                BracketPairView(pair: SeriesPair(fromSeries:bracketData.series[7]))
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
