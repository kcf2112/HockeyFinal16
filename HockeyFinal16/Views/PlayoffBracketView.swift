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

    // Static data file for test only.  Convert to api retrieval.
    // var bracketData: Bracket = Bundle.main.decode("playoffs2024.json")
     
    @State private var playoffYear = "2024"
    @State private var playoffYearIdx = 1
    @StateObject var dataManager = NHLDataManager()
    
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
                    await dataManager.loadBracket(year: playoffYear)
                }
            }
            VStack {
                Spacer()
                HStack(spacing: 15) {
                    // Final 16, Eastern Conference group.
                    // TODO: Rethink the 'bracketBucket' approach.
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[0])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[0]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[1])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[1]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[2])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[2]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[3])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[3]))
                    }
                }
                Spacer()
                HStack(spacing: 90) {
                    // Quarterfinals.
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[8])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[8]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[9])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[9]))
                    }
                }
                Spacer()
                Text("Eastern Conference")
                Spacer()
                HStack {
                    // Semifinals: Eastern Conference finals.
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[12])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[12]))
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
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[14])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[14]))
                    }
                }
                .frame(minWidth: 1, maxWidth: .infinity )
                .padding(-3)
                .background(.yellow)
                Spacer()
                HStack {
                    // Semifinals: Western Conference finals.
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[13])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[13]))
                    }
                }
                Spacer()
                Text("Western Conference")
                Spacer()
                HStack(spacing: 90) {
                    // Quarterfinals.
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[10])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[10]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[11])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[11]))
                    }
                }
                Spacer()
                HStack(spacing: 15) {
                    // Final 16, Western Conference group.
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[4])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[4]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[5])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[5]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[6])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[6]))
                    }
                    NavigationLink {
                        SeriesDetailView(fromSeries: dataManager.bracketBucket[0].series[7])
                    } label: {
                        BracketPairView(pair: SeriesPair(fromSeries: dataManager.bracketBucket[0].series[7]))
                    }
                }
                Spacer()
            }
            .padding([.leading, .trailing], 10)
            .navigationTitle("NHL Playoffs")
            .task {
                print("Invoke dataManager.loadBracket with year: \(playoffYear)")
                await dataManager.loadBracket(year: playoffYear)
            }

        }
    }
    
    // TODO: This function does not work in this context.
    // Review DivDemo (which is similar and works) to see how to
    // retrieve data asynchronously.
//    @MainActor
//    func changePlayoffYear() async {
//        print("changePlayoffYear: Retrieve new data...")
//        let url = "https://api-web.nhle.com/v1/playoff-bracket/2025"
//        var bracketData: Bracket
//        let httpSvc = HttpService<Bracket>( urlString: url )
//        
//        do {
//            bracketData = try await httpSvc.getJSON()
//            //bracketData = try httpSvc.getJSON()
//        }
//        catch {
//            if( error.localizedDescription == "cancelled" ) {
//                // Not a true retrieval error, a routine task cancellation
//            }
//            else {
//                print( "Could not retrieve data: \(error)" );
//            }
//        }
//    }
}
