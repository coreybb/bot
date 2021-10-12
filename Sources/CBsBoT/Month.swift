//
//  Month.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

public enum Month: String, CaseIterable {
    
    case january = "January"
    case february = "February"
    case march = "March"
    case april = "April"
    case may = "May"
    case june = "June"
    case july = "July"
    case august = "August"
    case september = "September"
    case october = "October"
    case november = "November"
    case december = "December"
    
    
    public var component: String {
        
        switch self {
        case .january: return "01"
        case .february: return "02"
        case .march: return "03"
        case .april: return "04"
        case .may: return "05"
        case .june: return "06"
        case .july: return "07"
        case .august: return "08"
        case .september: return "09"
        case .october: return "10"
        case .november: return "11"
        case .december: return "12"
        }
    }
}
