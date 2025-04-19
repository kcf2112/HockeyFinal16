//
//  BoxScore.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/18/25.
//

import Foundation

struct BoxScore: Codable {
    struct Venue: Codable {
        var `default`: String = ""
    }

    struct VenueLocation: Codable {
        var `default`: String = ""
    }

    struct TvBroadcast: Codable {
        var id: Int = 0
        var market: String = ""
        var countryCode: String = ""
        var network: String = ""
        var sequenceNumber: Int = 0
    }

    struct PeriodDescriptor: Codable {
        var number: Int = 0
        var periodType: String = ""
        var maxRegulationPeriods: Int = 0
    }

    struct AwayTeam: Codable {
        struct CommonName: Codable {
            var `default`: String = ""
        }

        struct PlaceName: Codable {
            var `default`: String = ""
        }

        struct PlaceNameWithPreposition: Codable {
            var `default`: String = ""
            var fr: String?
        }

        var id: Int = 0
        var commonName: CommonName = CommonName()
        var abbrev: String = ""
        var score: Int = 0
        var sog: Int = 0
        var logo: URL?
        var darkLogo: URL?
        var placeName: PlaceName = PlaceName()
        var placeNameWithPreposition: PlaceNameWithPreposition = PlaceNameWithPreposition()
    }

    struct HomeTeam: Codable {
        struct CommonName: Codable {
            var `default`: String = ""
        }

        struct PlaceName: Codable {
            var `default`: String = ""
            var fr: String?
        }

        struct PlaceNameWithPreposition: Codable {
            var `default`: String = ""
            var fr: String?
        }

        var id: Int = 0
        var commonName: CommonName = CommonName()
        var abbrev: String = ""
        var score: Int = 0
        var sog: Int = 0
        var logo: URL?
        var darkLogo: URL?
        var placeName: PlaceName = PlaceName()
        var placeNameWithPreposition: PlaceNameWithPreposition = PlaceNameWithPreposition()
    }

    struct Clock: Codable {
        var timeRemaining: String = ""
        var secondsRemaining: Int = 0
        var running: Bool = false
        var inIntermission: Bool = false
    }

    struct PlayerByGameStat: Codable {
        struct AwayTeam: Codable {
            struct Forward: Codable {
                struct Name: Codable {
                    var `default`: String = ""
                    var cs: String?
                    var fi: String?
                    var sk: String?
                }

                var playerID: Int = 0
                var sweaterNumber: Int = 0
                var name: Name = Name()
                var position: String = ""
                var goals: Int = 0
                var assists: Int = 0
                var points: Int = 0
                var plusMinus: Int = 0
                var pim: Int = 0
                var hits: Int = 0
                var powerPlayGoals: Int = 0
                var sog: Int = 0
                var faceoffWinningPctg: Double = 0.0
                var toi: String = ""
                var blockedShots: Int = 0
                var shifts: Int = 0
                var giveaways: Int = 0
                var takeaways: Int = 0

                private enum CodingKeys: String, CodingKey {
                    case playerID = "playerId"
                    case sweaterNumber
                    case name
                    case position
                    case goals
                    case assists
                    case points
                    case plusMinus
                    case pim
                    case hits
                    case powerPlayGoals
                    case sog
                    case faceoffWinningPctg
                    case toi
                    case blockedShots
                    case shifts
                    case giveaways
                    case takeaways
                }
            }

            struct Defense: Codable {
                struct Name: Codable {
                    var `default`: String = ""
                    var cs: String?
                    var sk: String?
                }

                var playerID: Int = 0
                var sweaterNumber: Int = 0
                var name: Name = Name()
                var position: String = ""
                var goals: Int = 0
                var assists: Int = 0
                var points: Int = 0
                var plusMinus: Int = 0
                var pim: Int = 0
                var hits: Int = 0
                var powerPlayGoals: Int = 0
                var sog: Int = 0
                var faceoffWinningPctg: Double = 0.0
                var toi: String = ""
                var blockedShots: Int = 0
                var shifts: Int = 0
                var giveaways: Int = 0
                var takeaways: Int = 0

                private enum CodingKeys: String, CodingKey {
                    case playerID = "playerId"
                    case sweaterNumber
                    case name
                    case position
                    case goals
                    case assists
                    case points
                    case plusMinus
                    case pim
                    case hits
                    case powerPlayGoals
                    case sog
                    case faceoffWinningPctg
                    case toi
                    case blockedShots
                    case shifts
                    case giveaways
                    case takeaways
                }
            }

            struct Goaly: Codable {
                struct Name: Codable {
                    var `default`: String = ""
                    var cs: String?
                    var fi: String?
                    var sk: String?
                }

                var playerID: Int = 0
                var sweaterNumber: Int = 0
                var name: Name = Name()
                var position: String = ""
                var evenStrengthShotsAgainst: String = ""
                var powerPlayShotsAgainst: String = ""
                var shorthandedShotsAgainst: String = ""
                var saveShotsAgainst: String = ""
                var savePctg: Double?
                var evenStrengthGoalsAgainst: Int = 0
                var powerPlayGoalsAgainst: Int = 0
                var shorthandedGoalsAgainst: Int = 0
                var pim: Int = 0
                var goalsAgainst: Int = 0
                var toi: String = ""
                var starter: Bool = false
                var decision: String?
                var shotsAgainst: Int = 0
                var saves: Int = 0

                private enum CodingKeys: String, CodingKey {
                    case playerID = "playerId"
                    case sweaterNumber
                    case name
                    case position
                    case evenStrengthShotsAgainst
                    case powerPlayShotsAgainst
                    case shorthandedShotsAgainst
                    case saveShotsAgainst
                    case savePctg
                    case evenStrengthGoalsAgainst
                    case powerPlayGoalsAgainst
                    case shorthandedGoalsAgainst
                    case pim
                    case goalsAgainst
                    case toi
                    case starter
                    case decision
                    case shotsAgainst
                    case saves
                }
            }

            var forwards: [Forward] = []
            var defense: [Defense] = []
            var goalies: [Goaly] = []
        }

        struct HomeTeam: Codable {
            struct Forward: Codable {
                struct Name: Codable {
                    var `default`: String = ""
                }

                var playerID: Int = 0
                var sweaterNumber: Int = 0
                var name: Name = Name()
                var position: String = ""
                var goals: Int = 0
                var assists: Int = 0
                var points: Int = 0
                var plusMinus: Int = 0
                var pim: Int = 0
                var hits: Int = 0
                var powerPlayGoals: Int = 0
                var sog: Int = 0
                var faceoffWinningPctg: Double = 0.0
                var toi: String = ""
                var blockedShots: Int = 0
                var shifts: Int = 0
                var giveaways: Int = 0
                var takeaways: Int = 0

                private enum CodingKeys: String, CodingKey {
                    case playerID = "playerId"
                    case sweaterNumber
                    case name
                    case position
                    case goals
                    case assists
                    case points
                    case plusMinus
                    case pim
                    case hits
                    case powerPlayGoals
                    case sog
                    case faceoffWinningPctg
                    case toi
                    case blockedShots
                    case shifts
                    case giveaways
                    case takeaways
                }
            }

            struct Defense: Codable {
                struct Name: Codable {
                    var `default`: String = ""
                }

                var playerID: Int = 0
                var sweaterNumber: Int = 0
                var name: Name = Name()
                var position: String = ""
                var goals: Int = 0
                var assists: Int = 0
                var points: Int = 0
                var plusMinus: Int = 0
                var pim: Int = 0
                var hits: Int = 0
                var powerPlayGoals: Int = 0
                var sog: Int = 0
                var faceoffWinningPctg: Double
                var toi: String = ""
                var blockedShots: Int = 0
                var shifts: Int = 0
                var giveaways: Int = 0
                var takeaways: Int = 0

                private enum CodingKeys: String, CodingKey {
                    case playerID = "playerId"
                    case sweaterNumber
                    case name
                    case position
                    case goals
                    case assists
                    case points
                    case plusMinus
                    case pim
                    case hits
                    case powerPlayGoals
                    case sog
                    case faceoffWinningPctg
                    case toi
                    case blockedShots
                    case shifts
                    case giveaways
                    case takeaways
                }
            }

            struct Goaly: Codable {
                struct Name: Codable {
                    var `default`: String = ""
                    var cs: String?
                    var fi: String?
                    var sk: String?
                }

                var playerID: Int = 0
                var sweaterNumber: Int = 0
                var name: Name = Name()
                var position: String = ""
                var evenStrengthShotsAgainst: String = ""
                var powerPlayShotsAgainst: String = ""
                var shorthandedShotsAgainst: String = ""
                var saveShotsAgainst: String = ""
                var evenStrengthGoalsAgainst: Int = 0
                var powerPlayGoalsAgainst: Int = 0
                var shorthandedGoalsAgainst: Int = 0
                var pim: Int = 0
                var goalsAgainst: Int = 0
                var toi: String = ""
                var starter: Bool = false
                var shotsAgainst: Int = 0
                var saves: Int = 0
                var savePctg: Double?
                var decision: String?

                private enum CodingKeys: String, CodingKey {
                    case playerID = "playerId"
                    case sweaterNumber
                    case name
                    case position
                    case evenStrengthShotsAgainst
                    case powerPlayShotsAgainst
                    case shorthandedShotsAgainst
                    case saveShotsAgainst
                    case evenStrengthGoalsAgainst
                    case powerPlayGoalsAgainst
                    case shorthandedGoalsAgainst
                    case pim
                    case goalsAgainst
                    case toi
                    case starter
                    case shotsAgainst
                    case saves
                    case savePctg
                    case decision
                }
            }

            var forwards: [Forward] = []
            var defense: [Defense] = []
            var goalies: [Goaly] = []
        }

        var awayTeam: AwayTeam = AwayTeam()
        var homeTeam: HomeTeam = HomeTeam()
    }

    struct Summary: Codable {
    }

    struct GameOutcome: Codable {
        var lastPeriodType: String = ""
    }

    var id: Int = 0
    var season: Int = 0
    var gameType: Int = 0
    var limitedScoring: Bool = false
    var gameDate: String = ""
    var venue: Venue = Venue()
    var venueLocation: VenueLocation = VenueLocation()
    var startTimeUTC: String = ""
    var easternUTCOffset: String = ""
    var venueUTCOffset: String = ""
    // var tvBroadcasts: [TvBroadcast]
    var gameState: String = ""
    var gameScheduleState: String = ""
    var periodDescriptor: PeriodDescriptor = PeriodDescriptor()
    var regPeriods: Int = 0
    var awayTeam: AwayTeam = AwayTeam()
    var homeTeam: HomeTeam = HomeTeam()
    var clock: Clock = Clock()
    var playerByGameStats: PlayerByGameStat = PlayerByGameStat()
    var summary: Summary = Summary()
    var gameOutcome: GameOutcome = GameOutcome()
}
