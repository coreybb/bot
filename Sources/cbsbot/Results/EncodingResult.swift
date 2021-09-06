//
//  EncodingResult.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import Foundation


public enum EncodingResult<T: Encodable> {
    
    case data([String : Any])
    case codingError(NSError)
}
