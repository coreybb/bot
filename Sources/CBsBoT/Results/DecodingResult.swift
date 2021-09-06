//
//  DecodingResult.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import Foundation


public enum DecodingResult <T: Codable> {
    
    case object(T)
    case codingError(NSError)
}

