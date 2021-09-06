//
//  HTTPError.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import Foundation


public enum HTTPError {
    
    case ok
    case moved
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case internalServerError
    case unavailable
    case noResponse
    case error(NSError)
    case unknown(String)
    case serialization(NSError)
}
