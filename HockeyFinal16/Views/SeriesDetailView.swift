//
//  SeriesDetailView.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/10/25.
//
import SwiftUI

struct SeriesDetailView: View {
    let series: Series
    let topAbbr: String
    let botAbbr: String
    let topName: String
    let botName: String

    init(fromSeries series: Series) {
        self.series = series
        topAbbr = series.topSeedTeam.abbrev;
        botAbbr = series.bottomSeedTeam.abbrev;
        topName = series.topSeedTeam.name.default;
        botName = series.bottomSeedTeam.name.default;
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(topName).font(.title2)
                Text(botName).font(.title2)
            }
            Spacer()
        }
        .padding()
        Divider()
        VStack {
            Text("Summary: Games won and game scores").font(.title3)
            Divider()
            Text("List of games: score, period, link to key stats").font(.title3)
            Divider()
            Text("URL: \(series.seriesURL)" )
                .background(Color(red: 255/255, green: 181/255, blue: 20/255))

        }
        Spacer()
    }
}
