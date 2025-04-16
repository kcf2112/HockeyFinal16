//
//  SeriesPair.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/10/25.
//

import SwiftUI

// Represents a pair of NHL teams that play a series of games in the bracket.
// See Models/Bracket.swift and Models/PlayoffSeries.swift for available info.
struct SeriesPair {
    var team1 = "?"
    var team1Wins = "0"
    var team1Color: Color = .white
    // TODO: Need to compute text color?
    var team1TextColor: Color = .gray

    var team2 = "?"
    var team2Wins = "0"
    var team2Color: Color = .white
    // TODO: Need to compute text color?
    var team2TextColor: Color = .gray

    init(fromSeries series: Bracket.Series) {
        team1 = series.topSeedTeam.abbrev;
        team1Wins = String(series.topSeedWins)
        
        if let team = TeamColors(rawValue: team1) {
            team1Color = team.primaryColor
        }
        
        team2 = series.bottomSeedTeam.abbrev
        team2Wins = String(series.bottomSeedWins)
        
        if let team = TeamColors(rawValue: team2) {
            team2Color = team.primaryColor
        }
    }
}

