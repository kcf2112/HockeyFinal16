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
//
@Observable
class NHLDataManager {
    
    let BASE_URL = "https://api-web.nhle.com/v1/"
    
    var boxScore = BoxScore()
    var bracket = Bracket()
    var gameScores: [String : [Int]] = [:]
    var gameStory = GameStory()
    var playoffSeries = PlayoffSeries()

    /*
     Retrieve the box score data for the specified game.
     */
    @MainActor
    func loadBoxScore( gameID: Int ) async {
        let targetUrl = BASE_URL + "gamecenter/" + String(gameID) + "/boxscore"
        print( "NHLDataManager loadBoxScore: targetUrl: \(targetUrl)" )
        
        let httpService = HttpService<BoxScore>( urlString: targetUrl )
        do {
            let box: BoxScore = try await httpService.getJSON(isJSONArray: false)
            boxScore = box
        }
        catch {
            if( error.localizedDescription.contains( "cancelled" ) ) {
                // Not a true retrieval error, a routine task cancellation
                print( "NHLDataManager: Data task cancelled: \(error)" );
            }
            else {
                print( "NHLDataManager: Could not retrieve BoxScore data: \(error)" );
            }
        }
    }
    
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
                print( "NHLDataManager: Could not retrieve Bracket data: \(error)" );
            }
            // bracket = NHLDataManager.defaultBracket
        }
    }
    
    @MainActor
    func loadGameStory( gameID: Int ) async {
        let targetUrl = BASE_URL + "wsc/game-story/" + String(gameID)
        print( "NHLDataManager loadGameStory: targetUrl: \(targetUrl)" )
        
        let httpService = HttpService<GameStory>( urlString: targetUrl )
        do {
            let gstory: GameStory = try await httpService.getJSON(isJSONArray: false)
            gameStory = gstory
        }
        catch {
            if( error.localizedDescription.contains( "cancelled" ) ) {
                // Not a true retrieval error, a routine task cancellation
                print( "NHLDataManager: Data task cancelled: \(error)" );
            }
            else {
                print( "NHLDataManager: Could not retrieve GameStory data: \(error)" );
            }
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
            
            // Build the series game scores here to simplify logic in the view.
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
                print( "NHLDataManager: Could not retrieve PlayoffSeries data: \(error)" );
            }
            // playoffSeries = PlayoffSeries()
        }
    }
}
