//
//  DateTimeUtils.swift
//  HockeyFinal16
//
//  Created by Kevin Filer on 4/17/25.
//

import SwiftUI

class DateTimeUtils {    
    static func getCurrentYear() -> Int {
        return Calendar.current.component(.year, from: Date())
    }
}
