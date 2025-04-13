//
//  Series.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/13/25.
//

import Foundation

struct PlayoffSeries: Codable {
    struct BottomSeedTeam: Codable {
        struct Name: Codable {
            var `default`: String
        }

        struct PlaceName: Codable {
            var `default`: String
        }

        struct PlaceNameWithPreposition: Codable {
            var `default`: String
            var fr: String
        }

        struct Conference: Codable {
            var name: String
            var abbrev: String
        }

        var id: Int
        var name: Name
        var abbrev: String
        var placeName: PlaceName
        var placeNameWithPreposition: PlaceNameWithPreposition
        var conference: Conference
        var record: String
        var seriesWins: Int
        var divisionAbbrev: String
        var seed: Int
        var logo: URL
        var darkLogo: URL
    }

    struct TopSeedTeam: Codable {
        struct Name: Codable {
            var `default`: String
        }

        struct PlaceName: Codable {
            var `default`: String
            var fr: String
        }

        struct PlaceNameWithPreposition: Codable {
            var `default`: String
            var fr: String
        }

        struct Conference: Codable {
            var name: String
            var abbrev: String
        }

        var id: Int
        var name: Name
        var abbrev: String
        var placeName: PlaceName
        var placeNameWithPreposition: PlaceNameWithPreposition
        var conference: Conference
        var record: String
        var seriesWins: Int
        var divisionAbbrev: String
        var seed: Int
        var logo: URL
        var darkLogo: URL
    }

    struct Game: Codable {
        struct Venue: Codable {
            var `default`: String
        }

        struct TvBroadcast: Codable {
            var id: Int
            var market: String
            var countryCode: String
            var network: String
            var sequenceNumber: Int
        }

        struct AwayTeam: Codable {
            struct CommonName: Codable {
                var `default`: String
            }

            struct PlaceName: Codable {
                var `default`: String
                var fr: String?
            }

            struct PlaceNameWithPreposition: Codable {
                var `default`: String
                var fr: String
            }

            var id: Int
            var commonName: CommonName
            var placeName: PlaceName
            var placeNameWithPreposition: PlaceNameWithPreposition
            var abbrev: String
            var score: Int
        }

        struct HomeTeam: Codable {
            struct CommonName: Codable {
                var `default`: String
            }

            struct PlaceName: Codable {
                var `default`: String
                var fr: String?
            }

            struct PlaceNameWithPreposition: Codable {
                var `default`: String
                var fr: String
            }

            var id: Int
            var commonName: CommonName
            var placeName: PlaceName
            var placeNameWithPreposition: PlaceNameWithPreposition
            var abbrev: String
            var score: Int
        }

        struct PeriodDescriptor: Codable {
            var number: Int
            var periodType: String
            var maxRegulationPeriods: Int
        }

        struct SeriesStatus: Codable {
            var topSeedWins: Int
            var bottomSeedWins: Int
        }

        struct GameOutcome: Codable {
            var lastPeriodType: String
            var otPeriods: Int?
        }

        var id: Date
        var season: Int
        var gameType: Int
        var gameNumber: Int
        var ifNecessary: Bool
        var venue: Venue
        var neutralSite: Bool
        var startTimeUTC: Date
        var easternUTCOffset: String
        var venueUTCOffset: String
        var venueTimezone: String
        var gameState: String
        var gameScheduleState: String
        var tvBroadcasts: [TvBroadcast]
        var awayTeam: AwayTeam
        var homeTeam: HomeTeam
        var gameCenterLink: String
        var periodDescriptor: PeriodDescriptor
        var seriesStatus: SeriesStatus
        var gameOutcome: GameOutcome
    }

    struct FullCoverageURL: Codable {
        var cs: URL
        var de: URL
        var sv: URL
        var fi: URL
        var sk: URL
        var en: URL
        var fr: URL
        var es: URL
    }

    var round: Int
    var roundAbbrev: String
    var roundLabel: String
    var seriesLetter: String
    var seriesLogo: URL
    var seriesLogoFr: URL
    var neededToWin: Int
    var length: Int
    var bottomSeedTeam: BottomSeedTeam
    var topSeedTeam: TopSeedTeam
    var games: [Game]
    var fullCoverageURL: FullCoverageURL

    private enum CodingKeys: String, CodingKey {
        case round
        case roundAbbrev
        case roundLabel
        case seriesLetter
        case seriesLogo
        case seriesLogoFr
        case neededToWin
        case length
        case bottomSeedTeam
        case topSeedTeam
        case games
        case fullCoverageURL = "fullCoverageUrl"
    }
}
