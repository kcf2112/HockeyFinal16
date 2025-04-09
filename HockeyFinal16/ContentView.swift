//
//  ContentView.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/3/25.
//
// TODO:
// - Find a free NHL playoff data feed.
// - Each pairing represents a series in the bracket
//   -- When tapped, a pairing opens a view to show info about the series.
//   -- Create a BracketPairView struct.
// - Combine team logos with team names.
// - Add series results (games won for each team).
//

import SwiftUI

let bracketSeriesWidth = 75.0

// Represents a pair of NHL teams that play a series of games in the bracket.
struct Pairing {
    var team1: String
    var team2: String
}

struct BracketPairView: View {
    let pair: Pairing
    
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
// TODO: Add logic to read data from a JSON file, probably in a ForEach
//
struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 15) {
                // Final 16, Western Conference group.
                BracketPairView(pair: Pairing(team1: "DAL", team2: "VGK"))
                BracketPairView(pair: Pairing(team1: "WPG", team2: "COL"))
                BracketPairView(pair: Pairing(team1: "VAN", team2: "NSH"))
                BracketPairView(pair: Pairing(team1: "EDM", team2: "LAK"))
            }
            Spacer()
            HStack(spacing: 80) {
                // Quarterfinals.
                BracketPairView(pair: Pairing(team1: "DAL", team2: "COL"))
                BracketPairView(pair: Pairing(team1: "VAN", team2: "EDM"))
            }
            Spacer()
            Text("Western Conference")
            Spacer()
            HStack {
                // Semifinals: Western Conference Championship series.
                BracketPairView(pair: Pairing(team1: "DAL", team2: "EDM"))
            }
            Spacer()
            HStack {
                // Finals: Stanley Cup series.
                // TODO: Add decoration to highlight this pairing.
                BracketPairView(pair: Pairing(team1: "EDM", team2: "FLA"))
            }
            Spacer()
            HStack {
                // Semifinals: Eastern Conference Championship series.
                BracketPairView(pair: Pairing(team1: "NYR", team2: "FLA"))
            }
            Spacer()
            Text("Eastern Conference")
            Spacer()
            HStack(spacing: 80) {
                // Quarterfinals.
                BracketPairView(pair: Pairing(team1: "FLA", team2: "BOS"))
                BracketPairView(pair: Pairing(team1: "NYR", team2: "CAR"))
            }
            Spacer()
            HStack(spacing: 15) {
                // Final 16, Eastern Conference group.
                BracketPairView(pair: Pairing(team1: "FLA", team2: "TBL"))
                BracketPairView(pair: Pairing(team1: "BOS", team2: "TOR"))
                BracketPairView(pair: Pairing(team1: "NYR", team2: "WSH"))
                BracketPairView(pair: Pairing(team1: "CAR", team2: "NYI"))
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
