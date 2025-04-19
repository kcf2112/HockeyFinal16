//
//  ScoringReportView.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/19/25.
//
import SwiftUI

// This view is used on the GameSummaryView to display scoring in each period.
struct ScoringReportView: View {
    @Environment(NHLDataManager.self) private var nhlData
    
    let periodText = ["", "1st Period", "2nd Period", "3rd Period", "OT"]
    
    let teamScoreW: CGFloat = 30
    let timeW: CGFloat = 50
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(nhlData.gameStory.summary.scoring) { scores in // GameStory.Summary.Scoring
                let periodIdx = scores.periodDescriptor.number
                HStack {
                    Text(periodText[periodIdx]).font(.footnote).bold()
                    Spacer()
                    HStack(spacing: 20) {
                        Text(nhlData.gameStory.homeTeam.abbrev).font(.footnote).bold().frame(minWidth: teamScoreW)
                        Text(nhlData.gameStory.awayTeam.abbrev).font(.footnote).bold().frame(minWidth: teamScoreW)
                    }
                }
                Divider()
                if scores.goals.isEmpty {
                    Text("No goals scored.")
                }
                else {
                    ForEach(scores.goals, id: \.self) { goal in
                        VStack(alignment: .leading) {
                            HStack {
                                HStack {
                                    Text("\(goal.timeInPeriod)").bold().frame(minWidth: timeW)
                                    Image("\(goal.teamAbbrev.default)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 25)
                                    Text("\(goal.name.default)")
                                }
                                Spacer()
                                HStack(spacing: 20) {
                                    Text("\(goal.homeScore)").frame(minWidth: teamScoreW)
                                    Text("\(goal.awayScore)").frame(minWidth: teamScoreW)
                                }
                            }
                        }
                    }
                }
                Spacer()
            } // ForEach score
        }
        Spacer()
    }
}

