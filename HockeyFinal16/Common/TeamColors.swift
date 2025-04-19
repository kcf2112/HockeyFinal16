//
//  TeamColors.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/11/25.
//  Adapted from TeamColorsEnum by Larry Burris
//

import Foundation
import SwiftUI

enum TeamColors: String, Hashable, CaseIterable
{
    case ANA, ARI, BOS, BUF, CGY, CAR, CHI, COL, CBJ, DAL, DET, EDM, FLA, LAK, MIN, MTL, NSH, NJD, NYI, NYR, OTT, PHI, PIT, SEA, SJS, STL, TBL, TOR, VAN, VGK, WSH, WPG
    
    var primaryColor: Color
    {
        switch self
        {
            case .ANA:
                return .metallicGold
            case .ARI:
                return .brickRed
            case .BOS:
                return .bostonGold
            case .BUF:
                return .royalBlue
            case .CGY:
                return .calgaryRed
            case .CAR:
                return .red
            case .CHI:
                return .gold
            case .COL:
                return .burgundy
            case .CBJ:
                return .unionBlue
            case .DAL:
                return .victoryGreen
            case .DET:
                return .red
            case .EDM:
                return .navy
            case .FLA:
                return .navy
            case .LAK:
                return .silver
            case .MIN:
                return .forestGreen
            case .MTL:
                return .montrealRed
            case .NSH:
                return .navy
            case .NJD:
                return .red
            case .NYI:
                return .islanderBlue
            case .NYR:
                return .blue
            case .OTT:
                return .red
            case .PHI:
                return .flyersOrange
            case .PIT:
                return .pittsburghGold
            case .SEA:
                return .boundlessBlue
            case .SJS:
                return .deepPacificTeal
            case .STL:
                return .royalBlue
            case .TBL:
                return .tampaBayBlue
            case .TOR:
                return .torontoBlue
            case .VAN:
                return .blue
            case .VGK:
                return .gold
            case .WSH:
                return .red
            case .WPG:
                return .polarNightBlue
        }
    }
    
    var secondaryColor: Color
    {
        switch self
        {
            case .ANA:
                return .black
            case .ARI:
                return .desertSand
            case .BOS:
                return .black
            case .BUF:
                return .gold
            case .CGY:
                return .yellow
            case .CAR:
                return .black
            case .CHI:
                return .black
            case .COL:
                return .blue
            case .CBJ:
                return .red
            case .DAL:
                return .silver
            case .DET:
                return .white
            case .EDM:
                return .orange
            case .FLA:
                return .red
            case .LAK:
                return .black
            case .MIN:
                return .ironRangeRed
            case .MTL:
                return .blue
            case .NSH:
                return .gold
            case .NJD:
                return .black
            case .NYI:
                return .islanderOrange
            case .NYR:
                return .red
            case .OTT:
                return .gold
            case .PHI:
                return .black
            case .PIT:
                return .black
            case .SEA:
                return .deepSeaBlue
            case .SJS:
                return .burntOrange
            case .STL:
                return .gold
            case .TBL:
                return .white
            case .TOR:
                return .white
            case .VAN:
                return .black
            case .VGK:
                return .black
            case .WSH:
                return .blue
            case .WPG:
                return .red
        }
    }
    
    var tertiaryColor: Color
    {
        switch self
        {
            case .ANA:
                return .orange
            case .ARI:
                return .black
            case .BOS:
                return .white
            case .BUF:
                return .silver
            case .CGY:
                return .black
            case .CAR:
                return .white
            case .CHI:
                return .red
            case .COL:
                return .silver
            case .CBJ:
                return .flatSilver
            case .DAL:
                return .black
            case .DET:
                return .white
            case .EDM:
                return .white
            case .FLA:
                return .flatGold
            case .LAK:
                return .white
            case .MIN:
                return .harvestGold
            case .MTL:
                return .white
            case .NSH:
                return .white
            case .NJD:
                return .white
            case .NYI:
                return .white
            case .NYR:
                return .white
            case .OTT:
                return .black
            case .PHI:
                return .white
            case .PIT:
                return .white
            case .SEA:
                return .red
            case .SJS:
                return .black
            case .STL:
                return .darkGray
            case .TBL:
                return .white
            case .TOR:
                return .white
            case .VAN:
                return .coolGray
            case .VGK:
                return .steelGray
            case .WSH:
                return .white
            case .WPG:
                return .silver
        }
    }
    var textColor: Color
    {
        switch self
        {
            case .ANA, .BOS, .CHI, .LAK, .PIT, .VGK:
                return .black
            default:
                return .white
        }
    }
}

extension Color
{
    static let bostonGold = Color(red: 252/255, green: 181/255, blue: 20/255)
    static let boundlessBlue = Color(red: 53/255, green: 84/255, blue: 100/255)
    static let brickRed = Color(red: 140, green: 38, blue: 51)
    static let burgundy = Color(red: 111/255, green: 38/255, blue: 61/255)
    static let burntOrange = Color(red: 229/255, green: 114/255, blue: 0)
    static let coolGray = Color(red: 151/255, green: 153/255, blue: 155/255)
    static let darkGray = Color(red: 124/255, green: 135/255, blue: 142/255)
    static let deepPacificTeal = Color(red: 0, green: 109/255, blue: 117/255)
    static let deepSeaBlue = Color(red: 0, green: 22/255, blue: 40/255)
    static let desertSand = Color(red: 226/255, green: 214/255, blue: 181/255)
    static let calgaryRed = Color(red: 210/255, green: 0, blue: 28/255)
    static let flatGold = Color(red: 185/255, green: 151/255, blue: 91/255)
    static let flatSilver = Color(red: 162/255, green: 170/255, blue: 173/255)
    static let flyersOrange = Color(red: 247/255, green: 73/255, blue: 2/255)
    static let forestGreen = Color(red: 2/255, green: 71/255, blue: 48/255)
    static let gold = Color(red: 204/255, green: 138/255, blue: 0)
    static let harvestGold = Color(red: 234/255, green: 170/255, blue: 0)
    static let iceBlue = Color(red: 153/255, green: 217/255, blue: 217/255)
    static let ironRangeRed = Color(red: 175/255, green: 35/255, blue: 36/255)
    static let islanderBlue = Color(red: 0, green: 83/255, blue: 155/255)
    static let islanderOrange = Color(red: 244/255, green: 125/255, blue: 48/255)
    static let metallicGold = Color(red: 181/255, green: 152/255, blue: 90/255)
    static let montrealRed = Color(red: 175/255, green: 30/255, blue: 45/255)
    static let navy = Color(red: 4/255, green: 30/255, blue: 66/255)
    static let navyBlue = Color(red: 0, green: 38/255, blue: 84/255)
    static let pittsburghGold = Color(red: 181/255, green: 152/255, blue: 90/255)
    static let polarNightBlue = Color(red: 4/255, green: 30/255, blue: 66/255)
    static let royalBlue = Color(red: 0, green: 48/255, blue: 135/255)
    static let silver = Color(red: 162/255, green: 170/255, blue: 173/255)
    static let steelGray = Color(red: 51/255, green: 63/255, blue: 72/255)
    static let tampaBayBlue = Color(red: 0, green: 40/255, blue: 104/255)
    static let torontoBlue = Color(red: 0, green: 32/255, blue: 91/255)
    static let unionBlue = Color(red: 0, green: 38/255, blue: 84/255)
    static let victoryGreen = Color(red: 0, green: 104/255, blue: 71/255)
}
