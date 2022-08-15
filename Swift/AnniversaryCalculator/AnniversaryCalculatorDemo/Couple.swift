//
//  Couple.swift
//  iOSTest
//
//  Created by ChenYilong on 10/11/21.
//

import Foundation

struct Couple {
    let coupleId: String
    let anniversary: String
    
    func shouldAnniversaryToRemind() -> Bool {
        if (anniversary.isEmpty || coupleId.isEmpty) {
            return false
        }
        
        let anniversaryAtStr = anniversary
        var anniversaryAt: Date = Date.dateFromISOString(string: anniversaryAtStr) ?? Date()
        
        if anniversaryAt >= Date() {
            return false
        }
        
        let gapYears: Int = Date.gapYears(date: anniversaryAt)
        
        anniversaryAt = Date.thisYearDate(pastDate: anniversaryAt)
        if gapYears % 10 == 0 {
            anniversaryAt = anniversaryAt.after(days: 14)
        } else if gapYears % 5 == 0 {
            anniversaryAt = anniversaryAt.after(days: 7)
        }
        
        let beginReminderDate = Date().after(days: 1)
        let endReminderDate = Date().after(days: 14)
        
        if anniversaryAt <= endReminderDate && anniversaryAt >= beginReminderDate {
            return true
        }
        return false
    }
    
}
