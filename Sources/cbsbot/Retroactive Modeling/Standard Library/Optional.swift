//
//  Optional.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

public extension Optional {
    
    func isNil() -> Bool {
        
        if case .none = self {
            return true
        }
        
        return false
    }
    
    
    mutating func clear() {
        self = nil
    }
}


public extension Optional where Wrapped: Collection {
    
    func isNilOrEmpty() -> Bool {
        self?.isEmpty ?? true
    }
}
