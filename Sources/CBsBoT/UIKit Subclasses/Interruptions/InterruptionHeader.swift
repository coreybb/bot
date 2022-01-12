//
//  InterruptionHeader.swift
//  
//
//  Created by Corey Beebe on 1/9/22.
//


public enum InterruptionHeader {
    
    case actionRequired
    case confirmation
    case generic
    case genericError
    case nothingToShow
    case success
    case userError
    case custom(String)
}



extension InterruptionHeader {
    
    var text: String {
        switch self {
        case .actionRequired: return "You may want to look into this."
        case .generic: return "Pardon the interruption."
        case .genericError: return "Something went wrong."
        case .userError: return "You can't do that at this time."
        case .confirmation: return "Are you sure?"
        case .nothingToShow: return "Nothing to see here..."
        case .success: return "Success!"
        case .custom(let customText): return customText
        }
    }
}


