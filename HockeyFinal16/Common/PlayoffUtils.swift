//
//  PlayoffUtils.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/14/25.
//

import SwiftUI

class PlayoffUtils {
    /*
     Returns a string like '20232024' that represents an NHL-formatted
     hockey season specifier.
     */
    static func buildSeasonID(playoffYear year: String) -> String {
        guard let playoffYearNum = Int(year) else {
            print("Could not parse playoff year")
            return ""
        }
        let startYear = playoffYearNum - 1
        return String(startYear) + String(playoffYearNum)
    }
    
    /*
     Returns a boolean indicating if a given team won the specified game.
     */
    static func isWinner(game: PlayoffSeries.Game, teamAbbrev: String) -> Bool {
        var teamAbbrevScore = 0
        var otherTeamScore = 0
        
        if teamAbbrev == game.homeTeam.abbrev {
            teamAbbrevScore = game.homeTeam.score
            otherTeamScore = game.awayTeam.score
        }
        else {
            teamAbbrevScore = game.awayTeam.score
            otherTeamScore = game.homeTeam.score
        }
        
        return teamAbbrevScore > otherTeamScore
    }
    
    /*
     Returns a string like '20232024' by parsing data in the
     specifed Series object.
     */
    static func parseSeasonID(fromSeries: Bracket.Series) -> String {
        let urlStr = fromSeries.seriesURL ?? ""
        
        // Parse out the year from the URL.
        let parts = urlStr.split(separator: "/")
        if parts.count < 3 {
            return ""
        }

        let season = PlayoffUtils.buildSeasonID(playoffYear: String(parts[2]))
        return season
    }
}
