//
//  SeriesDetailView.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/10/25.
//
import SwiftUI

struct SeriesDetailView: View {
    @State var nhlData = NHLDataManager()
    
    // let series: Series // Series info carried in Bracket.
    let topAbbr: String
    let botAbbr: String
    let topName: String
    let botName: String
    
    let topScores: [Int] = []
    let botScores: [Int] = []

    let season: String
    let seriesLetter: String
    
    let numW: CGFloat = 25
    let numH: CGFloat = 25
    let teamW: CGFloat = 190
    let gridGap: CGFloat = 2

    init(fromSeries series: Bracket.Series) {
        // self.series = series
        topAbbr = series.topSeedTeam.abbrev;
        botAbbr = series.bottomSeedTeam.abbrev;
        topName = series.topSeedTeam.commonName.default; // Mascot name
        botName = series.bottomSeedTeam.commonName.default;
        
        season = PlayoffUtils.parseSeason(fromSeries: series)
        seriesLetter = series.seriesLetter
        
        // topScores = getTeamScores(forTeamAbbrev: topAbbr, games: )
    }

    var body: some View {
        VStack {
            Text("\(topName) vs \(botName)").font(.title)
            Text("Series: \(nhlData.playoffSeries.seriesLetter)")
            Divider()
            VStack {
                VStack(alignment: .leading, spacing: gridGap) {
                    HStack(spacing: gridGap) {
                        Text("\(topName)").frame(width: teamW, height: numH).background(.gray)
                        ForEach(nhlData.playoffSeries.games) { game in
                            let score = game.homeTeam.abbrev == topAbbr ? game.homeTeam.score : game.awayTeam.score
                            Text("\(score)").frame(width: numW, height: numH).background(.gray)
                        }
                        ForEach(((nhlData.playoffSeries.games.count)..<7), id: \.self) { _ in
                            Text("").frame(width: numW, height: numH).background(.gray)
                        }
                    }
                    HStack(spacing: gridGap) {
                        Text("\(botName)").frame(width: teamW, height: numH).background(.gray)
                        ForEach(nhlData.playoffSeries.games) { game in
                            let score = game.homeTeam.abbrev == botAbbr ? game.homeTeam.score : game.awayTeam.score
                            Text("\(score)").frame(width: numW, height: numH).background(.gray)
                        }
                        ForEach(((nhlData.playoffSeries.games.count)..<7), id: \.self) { _ in
                            Text("").frame(width: numW, height: numH).background(.gray)
                        }
                    }
                }
                
                Divider()
                Text("List of games: score, period, link to key stats").font(.title3)
            }
            .task {
                print("Invoke dataManager.loadSeries with season: \(season) and series: \(seriesLetter)")
                await nhlData.loadPlayoffSeries(season: season, seriesLetter: seriesLetter)
            }
            Spacer()
        }
    }
    
    func getTeamScores(forTeamAbbrev: String, games: [PlayoffSeries.Game]) -> [Int] {
        var scores = [Int]()
        for game in games {
            if game.awayTeam.abbrev == forTeamAbbrev {
                scores.append(game.awayTeam.score)
            }
            else {
                scores.append(game.homeTeam.score)
            }
        }
        return scores
    }
}
