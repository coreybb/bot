//
//  Int.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import Foundation


public extension Int {
    
    
    var asWord: String {
        
        let numberValue: NSNumber = NSNumber(value: self)
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        guard let word: String = formatter.string(from: numberValue) else {
            print("Unable tried to return a description of \(self) with formatted NSNumber \(String(describing: numberValue))!")
            return ""
        }
        
        return word
    }
    
    var isEven: Bool { return self._lowWord & 1 == 0 }
    var isZero: Bool { return self == 0 }
    var isGreaterThanZero: Bool { return self > 0 }
    var isGreaterThanOne: Bool { return self > 1 }
}
