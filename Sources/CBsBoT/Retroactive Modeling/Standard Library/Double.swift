//
//  Double.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import Foundation


public extension Double {
    
    func toCurrencyString() -> String {
        
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency

        let dash: String = "-"
        let emdash: String = "—"
        let formattedNumberString: String = numberFormatter
            .string(from: NSNumber(value: self))!
            .replacingOccurrences(of: dash, with: emdash)

        return formattedNumberString
    }
}
