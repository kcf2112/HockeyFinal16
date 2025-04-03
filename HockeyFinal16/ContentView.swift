//
//  ContentView.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/3/25.
//
// TODO:
// - Find a free NHL playoff data feed.
// - Each pairing represents a series in the bracket; create a BracketSeriesView.
// - Combine team logos with team names.
// - Add series results (games won for each team).
//

import SwiftUI

// This screen lays out shape and text components to depict a
// playoff bracket.
//
struct ContentView: View {
    let bracketSeriesWidth = 80.0
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 45) {
                // Final 16, group 1.
                VStack {
                    Text("DAL")
                    Text("VGK")
                }
                VStack {
                    Text("WPG")
                    Text("COL")
                }
                VStack {
                    Text("VAN")
                    Text("NSH")
                }
                VStack {
                    Text("EDM")
                    Text("LAK")
                }
            }
            Spacer()
            HStack(spacing: 120) {
                // Quarterfinals, group 1.
                VStack {
                    Text("DAL")
                    Text("COL")
                }
                VStack {
                    Text("VAN")
                    Text("EDM")
                }
            }
            Spacer()
            HStack {
                // Semifinals, series 1.
                VStack {
                    Text("DAL")
                    Text("EDM")
                }
            }
            Spacer()
            HStack {
                // Finals, Stanley Cup.
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 70)
                    VStack {
                        Text("EDM")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)
                        Text("FLA")
                            .foregroundStyle(.white)
                    }
                }
            }
            Spacer()
            HStack {
                // Semifinals, series 2.
                VStack {
                    Text("NYR")
                    Text("FLA")
                }
            }
            Spacer()
            HStack(spacing: 120) {
                // Quarterfinals, group 2.
                VStack {
                    Text("FLA")
                    Text("BOS")
                }
                VStack {
                    Text("NYR")
                    Text("CAR")
                }
            }
            Spacer()
            HStack(spacing: 45) {
                // Final 16, group 2.
                VStack {
                    Text("FLA")
                    Text("TBL")
                }
                VStack {
                    Text("BOS")
                    Text("TOR")
                }
                VStack {
                    Text("NYR")
                    Text("WSH")
                }
                VStack {
                    Text("CAR")
                    Text("NYI")
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
