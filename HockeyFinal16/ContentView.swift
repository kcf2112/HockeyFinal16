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
//   -- Create a BracketSeriesView struct.
// - Combine team logos with team names.
// - Add series results (games won for each team).
//

import SwiftUI

// This screen lays out shape and text components to depict a
// playoff bracket.
//
struct ContentView: View {
    let bracketSeriesWidth = 75.0
    // let bracketSeriesWidth = 80.0
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 15) {
                // Final 16, group 1.
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("DAL")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)

                        Text("VGK")
                            .foregroundStyle(.white)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("WPG")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)

                        Text("COL")
                            .foregroundStyle(.white)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("VAN")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)

                        Text("NSH")
                            .foregroundStyle(.white)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("EDM")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)

                        Text("LAK")
                            .foregroundStyle(.white)
                    }
                }
            }
            Spacer()
            HStack(spacing: 80) {
                // Quarterfinals, group 1.
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("DAL")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)

                        Text("COL")
                            .foregroundStyle(.white)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("VAN")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)

                        Text("EDM")
                            .foregroundStyle(.white)
                    }
                }
            }
            Spacer()
            HStack {
                // Semifinals, series 1.
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("DAL")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)
                        Text("EDM")
                            .foregroundStyle(.white)
                    }
                }
            }
            Spacer()
            HStack {
                // Finals, Stanley Cup.
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
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
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("NYR")
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
            HStack(spacing: 80) {
                // Quarterfinals, group 2.
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("FLA")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)
                        Text("BOS")
                            .foregroundStyle(.white)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("NYR")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)
                        Text("CAR")
                            .foregroundStyle(.white)
                    }
                }
            }
            Spacer()
            HStack(spacing: 15) {
                // Final 16, group 2.
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("FLA")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)

                        Text("TBL")
                            .foregroundStyle(.white)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("BOS")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)

                        Text("TOR")
                            .foregroundStyle(.white)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("NYR")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)

                        Text("WSH")
                            .foregroundStyle(.white)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                        .frame(width: bracketSeriesWidth, height: 65)
                    VStack {
                        Text("CAR")
                            .foregroundStyle(.white)
                        Divider()
                            .frame(width: 80)
                            .overlay(.white)

                        Text("NYI")
                            .foregroundStyle(.white)
                    }
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
