//
//  Optional.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

extension Optional {
    
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


extension Optional where Wrapped: Collection {
    
    func isNilOrEmpty() -> Bool {
        self?.isEmpty ?? true
    }
}
