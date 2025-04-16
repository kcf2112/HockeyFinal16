//
//  BracketView.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/12/25.
//
import Foundation
import SwiftUI

let bracketSeriesWidth = 75.0

// This screen lays out shape and text components to depict a
// playoff bracket.
// See Models/Bracket.swift for info about the data.
//
// Each pairing represents a series played by two teams in the bracket
// - When tapped, a pairing opens a view to show info about the series.
// - BracketPairView struct displays available data about all pairings.

// TODO:
// - Combine team logos with team names (if space permits.)
// - Add games won alongside the team abbreviations.
// - Add team colors to pairings
// - Add a background color

struct PlayoffBracketView: View {
    // This defines the various team pairings on the playoff bracket.
    struct BracketPairView: View {
        let pair: SeriesPair
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                Gradient.Stop(color: pair.team1Color, location: 0.5),
                                Gradient.Stop(color: pair.team2Color, location: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom))
                    .frame(width: bracketSeriesWidth, height: 65)
                // Outline the ractangle.
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 3)
                    .frame(width: bracketSeriesWidth, height: 65)
                // Horizontal line.
                Rectangle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: bracketSeriesWidth, height: 1)
                VStack {
                    Spacer()
                    HStack() {
                        // TODO: Compute text color for better contrast?
                        Text(pair.team1).foregroundStyle(.white)
                        Text(pair.team1Wins).foregroundStyle(.white)
                    }
                    Spacer()
                    HStack() {
                        Text(pair.team2).foregroundStyle(.white)
                        Text(pair.team2Wins).foregroundStyle(.white)
                    }
                    Spacer()
                }
            }
        }
    }

    // Static data file for test only.  Convert to api retrieval.
    // var bracketData: Bracket = Bundle.main.decode("playoffs2024.json")
     
    @State private var playoffYear = "2024"
    @State private var playoffYearIdx = 1
    @State var nhlData = NHLDataManager()
    
    let years = ["2025", "2024", "2023", "2022", "2021", "2020"]
        
    // See Models/Bracket.swift for info about the playoff data.
    var body: some View {
        NavigationStack {
            Picker("Playoff year", selection: $playoffYear) {
                ForEach(years, id: \.self) { /*selYear in
                    // Attempt to style picker text:
                    Text("\(selYear)").tag(selYear) // <--- tag
                        .foregroundColor(.black)
                        .font(.title3)*/
                    Text($0).font(.title3)
                }
            }
            .onChange(of: playoffYear) {
                Task {
                    await nhlData.loadBracket(year: playoffYear)
                }
            }
            VStack {
                Spacer()
                HStack(spacing: 15) {
                    // Final 16, Eastern Conference group.
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[0])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[0]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[1])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[1]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[2])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[2]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[3])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[3]))
                    }
                }
                Spacer()
                HStack(spacing: 90) {
                    // Quarterfinals.
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[8])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[8]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[9])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[9]))
                    }
                }
                Spacer()
                Text("Eastern Conference")
                Spacer()
                HStack {
                    // Semifinals: Eastern Conference finals.
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[12])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[12]))
                    }
                }
                Spacer()
                HStack() {
                    // Finals: Stanley Cup series.
                    Image("NHLPLAYOFFS")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[14])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[14]))
                    }
                }
                Spacer()
                HStack {
                    // Semifinals: Western Conference finals.
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[13])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[13]))
                    }
                }
                Spacer()
                Text("Western Conference")
                Spacer()
                HStack(spacing: 90) {
                    // Quarterfinals.
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[10])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[10]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[11])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[11]))
                    }
                }
                Spacer()
                HStack(spacing: 15) {
                    // Final 16, Western Conference group.
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[4])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[4]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[5])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[5]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[6])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[6]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: nhlData.bracket.series[7])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: nhlData.bracket.series[7]))
                    }
                }
                Spacer()
            }
            .padding([.leading, .trailing], 10)
            .navigationTitle("NHL Final 16 \(playoffYear)")
            .task {
                await nhlData.loadBracket(year: playoffYear)
            }

        }
    }
}
