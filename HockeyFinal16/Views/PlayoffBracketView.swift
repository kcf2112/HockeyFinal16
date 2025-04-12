//
//  BracketView.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/12/25.
//
import SwiftUI

let bracketSeriesWidth = 75.0

// This screen lays out shape and text components to depict a
// playoff bracket.
// See Models/Bracket.swift for info about the data.
//
// Each pairing represents a series played by two teams in the bracket
// - When tapped, a pairing opens a view to show info about the series.
// - BracketPairView struct displays available data about all pairings.
//
// TODO:
// - Combine team logos with team names (if space permits.)
// - Add series results (games won for each team) alongside the team abbreviations.
//

struct PlayoffBracketView: View {
    // Static data file for test only.  Convert to api retrieval.
    let bracketData: Bracket = Bundle.main.decode("playoffs2024.json")
     
    // This defines the various team pairings on the playoff bracket.
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

//    var bracketData: Bracket
//    var httpSvc = HttpService<Bracket>( urlString: url )
//
//    init() async {
//        do {
//            bracketData = try await httpSvc.getJSON()
//        }
//        catch {
//            if( error.localizedDescription == "cancelled" ) {
//                // Not a true retrieval error, a routine task cancellation
//            }
//            else {
//                print( "Could not retrieve DividendTTM: \(error)" );
//            }
//        }
//    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                HStack(spacing: 15) {
                    // Final 16, Eastern Conference group.
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[0])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[0]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[1])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[1]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[2])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[2]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[3])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[3]))
                    }
                }
                Spacer()
                HStack(spacing: 90) {
                    // Quarterfinals.
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[8])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[8]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[9])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[9]))
                    }
                }
                Spacer()
                Text("Eastern Conference")
                Spacer()
                HStack {
                    // Semifinals: Eastern Conference finals.
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[12])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[12]))
                    }
                }
                Spacer()
                HStack() {
                    // Finals: Stanley Cup series.
                    // TODO: Add decoration to highlight this pairing.
                    Image("NHLPLAYOFFS")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[14])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[14]))
                    }
                }
                .frame(minWidth: 1, maxWidth: .infinity )
                .padding(-3)
                .background(.yellow)
                Spacer()
                HStack {
                    // Semifinals: Western Conference finals.
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[13])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[13]))
                    }
                }
                Spacer()
                Text("Western Conference")
                Spacer()
                HStack(spacing: 90) {
                    // Quarterfinals.
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[10])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[10]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[11])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[11]))
                    }
                }
                Spacer()
                HStack(spacing: 15) {
                    // Final 16, Western Conference group.
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[4])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[4]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[5])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[5]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[6])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[6]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: bracketData.series[7])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: bracketData.series[7]))
                    }
                }
                Spacer()
            }
            .padding([.leading, .trailing], 10)
            .navigationTitle("NHL Playoffs 2024")
        }
    }
}
