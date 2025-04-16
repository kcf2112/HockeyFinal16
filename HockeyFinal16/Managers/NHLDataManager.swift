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
    
    // TODO: Fix this.
    // A default data set might be needed, but we should be able to download it.
    static var defaultBracket: Bracket = Bundle.main.decode("playoffs2024.json")
    
    var bracket = Bracket()
    var playoffSeries = PlayoffSeries()
    
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
}
