//
//  Float.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import Foundation


public extension Float {
    
    
    var toCurrencyString: String {
        
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency

        let formattedNumberString: String = numberFormatter
            .string(from: NSNumber(value: self))!
            .replacingOccurrences(of: "-", with: "—")

        return formattedNumberString
    }
    
    
    var toCurrencyStringNoSymbol: String {
        
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = ""
        
        let formattedNumberString: String = numberFormatter
            .string(from: NSNumber(value: self))!
            .replacingOccurrences( of: "-", with: "—")
        
        return formattedNumberString
    }
}
