//
//  Pairing.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/10/25.
//

// Represents a pair of NHL teams that play a series of games in the bracket.
// See Models/Bracket.swift for available info.
struct SeriesPair {
    var team1 = "?"
    var team2 = "?"
    
    init(fromSeries series: Series) {
        team1 = series.topSeedTeam.abbrev;
        team2 = series.bottomSeedTeam.abbrev;
    }
}

