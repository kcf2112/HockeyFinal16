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
    let topAbbrev: String
    let botAbbrev: String
    
    let topName: String
    let botName: String
    let topLongName: String
    let botLongName: String

    var topColor = Color.gray
    var botColor = Color.gray
    var topTextColor = Color.white
    var botTextColor = Color.white

    let season: String
    let seriesLetter: String
    
    // Used in the game score grid.
    let numW: CGFloat = 25
    let numH: CGFloat = 25
    let teamW: CGFloat = 190
    let gridGap: CGFloat = 2
    
    let logoSize: CGFloat = 70

    init(fromSeries series: Bracket.Series) {
        // self.series = series
        topAbbrev = series.topSeedTeam?.abbrev ?? "?";
        botAbbrev = series.bottomSeedTeam?.abbrev ?? "?";
        
        topName = series.topSeedTeam?.commonName.default ?? "?"; // Mascot name
        botName = series.bottomSeedTeam?.commonName.default ?? "?";
        topLongName = series.topSeedTeam?.name.default ?? "?";   // Mascot name
        botLongName = series.bottomSeedTeam?.name.default ?? "?";

        if let team = TeamColors(rawValue: topAbbrev) {
            topColor = team.primaryColor
            topTextColor = team.textColor
        }
        
        if let team = TeamColors(rawValue: botAbbrev) {
            botColor = team.primaryColor
            botTextColor = team.textColor
        }

        season = PlayoffUtils.parseSeasonID(fromSeries: series)
        seriesLetter = series.seriesLetter
    }

    var body: some View {
        Spacer()
        VStack {
            VStack {
                // Game scores grid.
                VStack(alignment: .leading, spacing: gridGap) {
                    HStack(spacing: gridGap) {
                        Text("\(topLongName)")
                            .frame(width: teamW, height: numH)
                            .background(topColor)
                            .foregroundStyle(topTextColor)
                        ForEach(nhlData.playoffSeries.games) { game in
                            let score =
                                game.homeTeam.abbrev == topAbbrev ? game.homeTeam.score : game.awayTeam.score
                            let topAbbrevIsWinner = PlayoffUtils.isWinner(game: game, teamAbbrev: topAbbrev)
                            Text("\(score)")
                                .frame(width: numW, height: numH)
                                .background((topAbbrevIsWinner ? Color.green : Color.gray))
                        }
                        // Blank boxes for unplayed games.
                        ForEach(((nhlData.playoffSeries.games.count)..<7), id: \.self) { _ in
                            Text("").frame(width: numW, height: numH).background(.gray)
                        }
                    }
                    HStack(spacing: gridGap) {
                        Text("\(botLongName)")
                            .frame(width: teamW, height: numH)
                            .background(botColor)
                            .foregroundStyle(botTextColor)
                        ForEach(nhlData.playoffSeries.games) { game in
                            let score =
                                game.homeTeam.abbrev == botAbbrev ? game.homeTeam.score : game.awayTeam.score
                            let botAbbrevIsWinner = PlayoffUtils.isWinner(game: game, teamAbbrev: botAbbrev)
                            Text("\(score)")
                                .frame(width: numW, height: numH)
                                .background((botAbbrevIsWinner ? Color.green : Color.gray))
                        }
                        // Blank boxes for unplayed games.
                        ForEach(((nhlData.playoffSeries.games.count)..<7), id: \.self) { _ in
                            Text("").frame(width: numW, height: numH).background(.gray)
                        }
                    }
                }
                // Game info.
                VStack {
                    if nhlData.playoffSeries.games.count < 1 {
                        Spacer()
                        Text("No games yet.").font(.headline)
                        Spacer()
                    }
                    ForEach(nhlData.playoffSeries.games) { game in
                        HStack {
                            Image("\(game.homeTeam.abbrev)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: logoSize, height: logoSize)
                            Text("\(game.homeTeam.score)")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                            VStack {
                                Text("\(game.gameState == "OFF" ? "Final" :"")").font(.callout)
                                Text("\(game.gameOutcome.lastPeriodType)").font(.callout)
                            }
                            // TODO: Add VStack for in-progress game: current period and time.
                            
                            Spacer()
                            Text("\(game.awayTeam.score)")
                                .font(.title)
                                .fontWeight(.bold)
                            Image("\(game.awayTeam.abbrev)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: logoSize, height: logoSize)
                        }
                    }
                }
            }
            .task {
                print("Invoke dataManager.loadSeries with season: \(season) and series: \(seriesLetter)")
                await nhlData.loadPlayoffSeries(season: season, seriesLetter: seriesLetter)
            }
        }
        Spacer()
    }
}
