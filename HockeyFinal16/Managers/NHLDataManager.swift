//
//  NHLDataManager.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/12/25.
//
// https://api-web.nhle.com/v1/playoff-bracket/\(year)
// https://api-web.nhle.com/v1/schedule/playoff-series/20232024/a
//  - Series letter not case sensitive

import Foundation
import SwiftUI

// Manages JSON data retrievals from the NHL data API site.
// See https://www.donnywals.com/comparing-observable-to-observableobjects/
@Observable // iOS 17.0 or newer
class NHLDataManager {
    
    let BASE_URL = "https://api-web.nhle.com/v1/"
    
    var bracket = Bracket()
    var playoffSeries = PlayoffSeries()
    var gameScores: [String : [Int]] = [:]
    
    /*
     Retrieve the entire 15-game playoff bracket.
     */
    @MainActor
    func loadBracket( year: String ) async {
        let targetUrl = BASE_URL + "playoff-bracket/" + year
        // print( "NHLDataManager loadBracket: targetUrl: \(targetUrl)" )
        
        let httpService = HttpService<Bracket>( urlString: targetUrl )
        do {
            let brack: Bracket = try await httpService.getJSON(isJSONArray: false)
            bracket = brack
        }
        catch {
            if( error.localizedDescription.contains( "cancelled" ) ) {
                // Not a true retrieval error, a routine task cancellation
                print( "NHLDataManager: Data task cancelled: \(error)" );
            }
            else {
                print( "NHLDataManager: Could not retrieve bracket data: \(error)" );
            }
            // bracket = NHLDataManager.defaultBracket
        }
    }
    
    /*
     Retrieve a specified playoff series (up to seven games) between two teams.
     */
    @MainActor
    func loadPlayoffSeries( season: String, seriesLetter: String ) async {
        let targetUrl = "\(BASE_URL)schedule/playoff-series/\(season)/\(seriesLetter)"
        // print( "NHLDataManager loadPlayoffSeries: targetUrl: \(targetUrl)" )
        
        let httpService = HttpService<PlayoffSeries>( urlString: targetUrl )
        do {
            let series: PlayoffSeries = try await httpService.getJSON(isJSONArray: false)
            playoffSeries = series
            
            // Building the series game scores here simplifies processing in the view.
            let topTeam = series.topSeedTeam.abbrev
            let botTeam = series.bottomSeedTeam.abbrev
            var topScores = [Int]()
            var botScores = [Int]()
            
            for game in series.games {
                let topScore =
                    game.awayTeam.abbrev == topTeam ? game.awayTeam.score : game.homeTeam.score
                topScores.append(topScore)
                let botScore =
                    game.awayTeam.abbrev == botTeam ? game.awayTeam.score : game.homeTeam.score
                botScores.append(botScore)
            }
            gameScores[topTeam] = topScores
            gameScores[botTeam] = botScores
        }
        catch {
            if( error.localizedDescription.contains( "cancelled" ) ) {
                // Not a true retrieval error, a routine task cancellation
                print( "NHLDataManager: Data task cancelled: \(error)" );
            }
            else {
                print( "NHLDataManager: Could not retrieve playoffSeries data: \(error)" );
            }
            // playoffSeries = PlayoffSeries()
        }
    }
    func isWinner(game: PlayoffSeries.Game, teamAbbrev: String) -> Bool {
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
}
