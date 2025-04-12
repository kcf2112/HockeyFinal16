//
//  TeamColors.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/11/25.
//  Adapted from TeamColorsEnum by Larry Burris
//

import Foundation
import SwiftUI

enum TeamColors: Hashable
{
    case ANA, ARI, BOS, BUF, CGY, CAR, CHI, COL, CBJ, DAL, DET, EDM, FLO, LAK, MIN, MTL, NSH, NJD, NYI, NYR, OTT, PHI, PIT, SEA, SJS, STL, TBL, TOR, VAN, VGK, WSH, WPJ
    
    var primaryColor: Color
    {
        switch self
        {
            case .ANA:
                return .metallicGold
            case .ARI:
                return .brickRed
            case .BOS:
                return .yellow
            case .BUF:
                return .navyBlue
            case .CGY:
                return .red
            case .CAR:
                return .red
            case .CHI:
                return .gold
            case .COL:
                return .burgundy
            case .CBJ:
                return .blue
            case .DAL:
                return .victoryGreen
            case .DET:
                return .red
            case .EDM:
                return .navy
            case .FLO:
                return .blue
            case .LAK:
                return .silver
            case .MIN:
                return .forestGreen
            case .MTL:
                return .red
            case .NSH:
                return .navy
            case .NJD:
                return .red
            case .NYI:
                return .royalBlue
            case .NYR:
                return .blue
            case .OTT:
                return .red
            case .PHI:
                return .orange
            case .PIT:
                return .pittsburghGold
            case .SEA:
                return .iceBlue
            case .SJS:
                return .deepPacificTeal
            case .STL:
                return .royalBlue
            case .TBL:
                return .tampaBayBlue
            case .TOR:
                return .blue
            case .VAN:
                return .blue
            case .VGK:
                return .gold
            case .WSH:
                return .red
            case .WPJ:
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
            case .FLO:
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
                return .orange
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
            case .WPJ:
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
            case .FLO:
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
            case .WPJ:
                return .silver
        }
    }
}

extension Color
{
    static let forestGreen = Color(UIColor(red: 21, green: 71, blue: 52, alpha: 1))
    static let metallicGold = Color(UIColor(red: 181, green: 152, blue: 90, alpha: 1))
    static let brickRed = Color(UIColor(red: 140, green: 38, blue: 51, alpha: 1))
    static let navyBlue = Color(UIColor(red: 0, green: 38, blue: 84, alpha: 1))
    static let gold = Color(UIColor(red: 204, green: 138, blue: 0, alpha: 1))
    static let burgundy = Color(UIColor(red: 111, green: 38, blue: 61, alpha: 1))
    static let victoryGreen = Color(UIColor(red: 0, green: 99, blue: 65, alpha: 1))
    static let navy = Color(UIColor(red: 4, green: 30, blue: 66, alpha: 1))
    static let silver = Color(UIColor(red: 162, green: 170, blue: 173, alpha: 1))
    static let royalBlue = Color(UIColor(red: 0, green: 48, blue: 135, alpha: 1))
    static let pittsburghGold = Color(UIColor(red: 181, green: 152, blue: 90, alpha: 1))
    static let iceBlue = Color(UIColor(red: 153, green: 217, blue: 217, alpha: 1))
    static let deepPacificTeal = Color(UIColor(red: 0, green: 98, blue: 114, alpha: 1))
    static let tampaBayBlue = Color(UIColor(red: 0, green: 32, blue: 91, alpha: 1))
    static let polarNightBlue = Color(UIColor(red: 4, green: 30, blue: 66, alpha: 1))
    static let desertSand = Color(UIColor(red: 226, green: 214, blue: 181, alpha: 1))
    static let ironRangeRed = Color(UIColor(red: 166, green: 25, blue: 46, alpha: 1))
    static let deepSeaBlue = Color(UIColor(red: 0, green: 22, blue: 40, alpha: 1))
    static let burntOrange = Color(UIColor(red: 229, green: 114, blue: 0, alpha: 1))
    static let flatSilver = Color(UIColor(red: 162, green: 170, blue: 173, alpha: 1))
    static let flatGold = Color(UIColor(red: 185, green: 151, blue: 91, alpha: 1))
    static let harvestGold = Color(UIColor(red: 234, green: 170, blue: 0, alpha: 1))
    static let darkGray = Color(UIColor(red: 124, green: 135, blue: 142, alpha: 1))
    static let coolGray = Color(UIColor(red: 151, green: 153, blue: 155, alpha: 1))
    static let steelGray = Color(UIColor(red: 51, green: 63, blue: 72, alpha: 1))
}
