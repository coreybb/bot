//
//  UserDefaults.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import Foundation


public extension UserDefaults {
    
    static func exists(key: String) -> Bool {
        
        return UserDefaults.standard.object(forKey: key) != nil
    }
}

