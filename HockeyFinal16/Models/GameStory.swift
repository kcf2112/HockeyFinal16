//
//  GameStory.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/18/25.
//

import Foundation

struct GameStory: Codable {
    struct Venue: Codable {
        var `default`: String = ""
    }

    struct VenueLocation: Codable {
        var `default`: String = ""
    }

    /* struct TvBroadcast: Codable {
        var id: Int
        var market: String
        var countryCode: String
        var network: String
        var sequenceNumber: Int
    } */

    struct AwayTeam: Codable {
        struct Name: Codable {
            var `default`: String = ""
        }

        struct PlaceName: Codable {
            var `default`: String = ""
        }

        var id: Int = 0
        var name: Name = Name()
        var abbrev: String = ""
        var placeName: PlaceName = PlaceName()
        var score: Int = 0
        var sog: Int = 0
        var logo: URL?
    }

    struct HomeTeam: Codable {
        struct Name: Codable {
            var `default`: String = ""
        }

        struct PlaceName: Codable {
            var `default`: String = ""
            var fr: String?
        }

        var id: Int = 0
        var name: Name = Name()
        var abbrev: String = ""
        var placeName: PlaceName = PlaceName()
        var score: Int = 0
        var sog: Int = 0
        var logo: URL?
    }

    struct Summary: Codable {
        struct Scoring: Codable {
            struct PeriodDescriptor: Codable {
                var number: Int = 0
                var periodType: String = ""
                var maxRegulationPeriods: Int = 0
            }

            struct Goal: Codable, Hashable {
                struct FirstName: Codable {
                    var `default`: String = ""
                }

                struct LastName: Codable {
                    var `default`: String = ""
                }

                struct Name: Codable {
                    var `default`: String = ""
                }

                struct TeamAbbrev: Codable {
                    var `default`: String = ""
                }

                struct LeadingTeamAbbrev: Codable {
                    var `default`: String = ""
                }

                struct Assist: Codable {
                    struct FirstName: Codable {
                        var `default`: String = ""
                    }

                    struct LastName: Codable {
                        var `default`: String = ""
                        var cs: String?
                        var fi: String?
                        var sk: String?
                    }

                    struct Name: Codable {
                        var `default`: String = ""
                        var cs: String?
                        var fi: String?
                        var sk: String?
                    }

                    var playerID: Int = 0
                    var firstName: FirstName = FirstName()
                    var lastName: LastName = LastName()
                    var name: Name = Name()
                    var assistsToDate: Int = 0
                    var sweaterNumber: Int = 0

                    private enum CodingKeys: String, CodingKey {
                        case playerID = "playerId"
                        case firstName
                        case lastName
                        case name
                        case assistsToDate
                        case sweaterNumber
                    }
                }

                var situationCode: String = ""
                var eventID: Int = 0
                var strength: String = ""
                var playerID: Int = 0
                var firstName: FirstName = FirstName()
                var lastName: LastName = LastName()
                var name: Name = Name()
                var teamAbbrev: TeamAbbrev
                var headshot: URL?
                var highlightClipSharingURL: URL?
                var highlightClipSharingUrlFr: URL?
                var highlightClip: Int = 0
                var highlightClipFr: Int?
                var discreteClip: Int = 0
                var discreteClipFr: Int?
                var goalsToDate: Int = 0
                var awayScore: Int = 0
                var homeScore: Int = 0
                var leadingTeamAbbrev: LeadingTeamAbbrev?
                var timeInPeriod: String = ""
                var shotType: String = ""
                var goalModifier: String = ""
                var assists: [Assist] = []
                var homeTeamDefendingSide: String = ""
                var isHome: Bool = false

                // Conform to Hashable.
                func hash(into hasher: inout Hasher) {
                    hasher.combine(eventID)
                    hasher.combine(timeInPeriod)
                }
                static func ==(lhs: Goal, rhs: Goal) -> Bool {
                    return lhs.eventID == rhs.eventID && lhs.timeInPeriod == rhs.timeInPeriod
                }
                
                private enum CodingKeys: String, CodingKey {
                    case situationCode
                    case eventID = "eventId"
                    case strength
                    case playerID = "playerId"
                    case firstName
                    case lastName
                    case name
                    case teamAbbrev
                    case headshot
                    case highlightClipSharingURL = "highlightClipSharingUrl"
                    case highlightClipSharingUrlFr
                    case highlightClip
                    case highlightClipFr
                    case discreteClip
                    case discreteClipFr
                    case goalsToDate
                    case awayScore
                    case homeScore
                    case leadingTeamAbbrev
                    case timeInPeriod
                    case shotType
                    case goalModifier
                    case assists
                    case homeTeamDefendingSide
                    case isHome
                }
            }

            var periodDescriptor: PeriodDescriptor
            var goals: [Goal]
        }

        struct ThreeStar: Codable {
            var star: Int = 0
            var playerID: Int = 0
            var teamAbbrev: String = ""
            var headshot: URL?
            var name: String = ""
            var sweaterNo: Int = 0
            var position: String = ""
            // Usually not present for goalies.
            var goals: Int?
            var assists: Int?
            var points: Int?

            private enum CodingKeys: String, CodingKey {
                case star
                case playerID = "playerId"
                case teamAbbrev
                case headshot
                case name
                case sweaterNo
                case position
                case goals
                case assists
                case points
            }
        }

        struct TeamGameStat: Codable {
            var category: String = ""
            var awayValue: Double = 0
            var homeValue: Double = 0
        }

        var scoring: [Scoring] = [] // One for each period (and Overtime period?)
        var threeStars: [ThreeStar] = []

        // TODO: Find the type for this; JSON has empty array
        // var shootout: [Any]
        
        // TODO: Add init() to handle Strings for awayValue and homeValue
        // See category: powerPlay
        // var teamGameStats: [TeamGameStat] = []
    }

    struct PeriodDescriptor: Codable {
        var number: Int = 0
        var periodType: String = ""
        var maxRegulationPeriods: Int = 0
    }

    struct Clock: Codable {
        var timeRemaining: String = ""
        var secondsRemaining: Int = 0
        var running: Bool = false
        var inIntermission: Bool = false
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
    var venueTimezone: String = ""
    // var tvBroadcasts: [TvBroadcast]
    var gameState: String = ""
    var gameScheduleState: String = ""
    var awayTeam: AwayTeam = AwayTeam()
    var homeTeam: HomeTeam = HomeTeam()
    var shootoutInUse: Bool = false
    var regPeriods: Int = 0
    var otInUse: Bool = false
    var tiesInUse: Bool = false
    var summary: Summary = Summary()
    var periodDescriptor: PeriodDescriptor = PeriodDescriptor()
    var clock: Clock = Clock()
}

extension GameStory.Summary.Scoring: Identifiable {
    var id: UUID {
        return UUID()
    }
}

