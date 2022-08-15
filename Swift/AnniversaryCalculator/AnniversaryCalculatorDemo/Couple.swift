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
        if (self.anniversary.isEmpty || self.coupleId.isEmpty) {
            return false;
        }
        
        let anniversaryAtStr = self.anniversary
        var anniversaryAt: Date = Date.dateFromISOString(string: anniversaryAtStr) ?? Date();

        if anniversaryAt >= Date() {
            return false
        }
        
        let gapYears: Int =  Date.gapYears(date: anniversaryAt)

        anniversaryAt = Date.thisYearDate(pastDate: anniversaryAt)
        if gapYears % 10 == 0 {
            anniversaryAt = anniversaryAt.afterDays(days: 14)
        } else if gapYears % 5 == 0 {
            anniversaryAt = anniversaryAt.afterDays(days: 7)
        }
         
        let beginReminderDate = Date().afterDays(days: 1)
        let endReminderDate = Date().afterDays(days: 14)
        
        if anniversaryAt <= endReminderDate  && anniversaryAt  >= beginReminderDate {
            return true
        }
        return false;
    }
    
}
