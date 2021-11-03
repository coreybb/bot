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
    case noResponse(URL?)
    case error(NSError)
    case unknown(String)
    case serialization(codingError: CodingError)
}


public extension HTTPError {
    
    var message: String {
        
        switch self {
        case .ok: return "The server returned an \"OK\" status."
        case .moved: return "Service at the specified endpoint has moved."
        case .badRequest: return "You've sent a bad request to the server."
        case .unauthorized: return "You're not authorized to access this service."
        case .forbidden: return "Access is forbidden at this endpoint."
        case .notFound: return "There was no service found at this endpoint."
        case .internalServerError: return "There was an internal server error at the specified endpoint. Try again later."
        case .unavailable: return "The service at this endpoint is currently unavailable."
        case .noResponse(let url):
            let url: String = url.isNil() ? "an unknown endpoint" : String(describing: url)
            return "There was no response from:\n\(url)"
        case .error(let message): return message.localizedDescription
        case .unknown(let message): return message
        case .serialization(codingError: let codingError):
            return "\nWe were unable to decode data returned in an HTTP response. The serialization error should specify the mislabelled or missing key:\n\(codingError.serializationError)\nPlease inspect the response data below to ensure that it matches your object model(s):\n\(codingError.dataString)\n"
        }
    }
}
