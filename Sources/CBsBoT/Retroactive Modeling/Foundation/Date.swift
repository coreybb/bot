//
//  Date.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import Foundation


public extension Date {
    
    
    //---------------------
    //  MARK: - Public API
    //---------------------
    func toPlaidDate() -> String {
        
        let components: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let monthString: String = PlaidDateComponent.month.string(from: components)
        let dayString: String = PlaidDateComponent.day.string(from: components)
        let toPlaidDate: String = "\(components.year!)-\(monthString)-\(dayString)"
        return toPlaidDate
    }
    
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }

    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
    
    var isInThePast: Bool {
        self < Date()
    }
    
    
    var beautified: String {
        
        let calendar: Calendar = Calendar.current
        let components: DateComponents = calendar.dateComponents([.year], from: self)
        let year: String = String(describing: components.year!)
        let month: String = monthString()
        let day: String = dayStringWithOriginalIndicator()
        let beautified: String = "\(month) \(day), \(year)"
        return beautified
    }
    
    
    var beautifiedAbbreviated: String {
        
        let calendar: Calendar = Calendar.current
        let components: DateComponents = calendar.dateComponents([.year, .day], from: self)
        let year: String = String(describing: components.year!)
        let month: String = abbreviatedMonthString()
        let day: String = String(describing: components.day!)
        let beautifiedAbbreviated: String = "\(month) \(day), \(year)"
        return beautifiedAbbreviated
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func plaidDate(from date: Date) -> String {
        
        let components: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let monthString: String = PlaidDateComponent.month.string(from: components)
        let dayString: String = PlaidDateComponent.day.string(from: components)
        let plaidDate: String = "\(components.year!)-\(monthString)-\(dayString)"
        return plaidDate
    }
    
    
    private func abbreviatedMonthString() -> String {
        
        var monthString: String = ""
        
        let calendar: Calendar = Calendar.current
        let components: DateComponents = calendar.dateComponents([.month], from: self)
        guard let month: Int = components.month else { return "MONTH" }
        
        switch month {
        case 1: monthString = "JAN"
        case 2: monthString = "FEB"
        case 3: monthString = "MAR"
        case 4: monthString = "APR"
        case 5: monthString = "MAY"
        case 6: monthString = "JUN"
        case 7: monthString = "JUL"
        case 8: monthString = "AUG"
        case 9: monthString = "SEP"
        case 10: monthString = "OCT"
        case 11: monthString = "NOV"
        case 12: monthString = "DEC"
        default: return "MONTH"
        }
        
        return monthString
    }
    
    
    private func monthString() -> String {
        
        var monthString: String = ""
        let calendar: Calendar = Calendar.current
        let components: DateComponents = calendar.dateComponents([.month], from: self)
        guard let month: Int = components.month else { return "MONTH" }
        
        switch month {
        case 1: monthString = "January"
        case 2: monthString = "February"
        case 3: monthString = "March"
        case 4: monthString = "April"
        case 5: monthString = "May"
        case 6: monthString = "June"
        case 7: monthString = "July"
        case 8: monthString = "August"
        case 9: monthString = "September"
        case 10: monthString = "October"
        case 11: monthString = "November"
        case 12: monthString = "December"
        default: return "MONTH"
        }
        
        return monthString
    }
    
    
    private func dayStringWithOriginalIndicator() -> String {
        
        var dayString: String = ""
        let calendar: Calendar = Calendar.current
        let components: DateComponents = calendar.dateComponents([.day], from: self)
        guard let day: Int = components.day else { return "DAY" }
        
        switch day {
        case 01: dayString = "1st"
        case 02: dayString = "2nd"
        case 03: dayString = "3rd"
        case 04: dayString = "4th"
        case 05: dayString = "5th"
        case 06: dayString = "6th"
        case 07: dayString = "7th"
        case 08: dayString = "8th"
        case 09: dayString = "9th"
        case 10: dayString = "10th"
        case 11: dayString = "11th"
        case 12: dayString = "12th"
        case 13: dayString = "13th"
        case 14: dayString = "15th"
        case 15: dayString = "15th"
        case 16: dayString = "16th"
        case 17: dayString = "17th"
        case 18: dayString = "18th"
        case 19: dayString = "19th"
        case 20: dayString = "20th"
        case 21: dayString = "21st"
        case 22: dayString = "22nd"
        case 23: dayString = "23rd"
        case 24: dayString = "24th"
        case 25: dayString = "25th"
        case 26: dayString = "26th"
        case 27: dayString = "27th"
        case 28: dayString = "28th"
        case 29: dayString = "29th"
        case 30: dayString = "30th"
        case 31: dayString = "31st"
        default: dayString = "DAY"
        }
        
        return dayString
    }
    
    
    private enum PlaidDateComponent: String {
        
        case month
        case day
        
        func string(from dateComponents: DateComponents) -> String {
            
            switch self {
            case .month:
                if dateComponents.month! < 10 {
                    return String(format: "%02d", dateComponents.month!)
                }
                return String(describing: dateComponents.month!)

            case .day:
                if dateComponents.day! < 10 {
                    return String(format: "%02d", dateComponents.day!)
                }
                return String(describing: dateComponents.day!)
            }
        }
    }
}
