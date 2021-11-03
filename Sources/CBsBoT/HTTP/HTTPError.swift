//
//  HTTPError.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import Foundation


public enum HTTPError {
    
    case ok
    case moved(URL?)
    case badRequest(URL?)
    case unauthorized(URL?)
    case forbidden(URL?)
    case notFound(URL?)
    case internalServerError(URL?)
    case unavailable(URL?)
    case noResponse(URL?)
    case error(NSError)
    case unknown(String)
    case serialization(codingError: CodingError)
}


public extension HTTPError {
    
    var message: String {
        
        switch self {
        case .ok: return "The server returned an \"OK\" status."
        case .moved(let url): return "Service at \(urlDescription(from: url)) has moved."
        case .badRequest(let url): return "You've sent a bad request to \(urlDescription(from: url))."
        case .unauthorized(let url): return "You're not authorized to access service at \(urlDescription(from: url))."
        case .forbidden(let url): return "Access is forbidden at \(urlDescription(from: url))."
        case .notFound(let url): return "There was no service found at \(urlDescription(from: url))t."
        case .internalServerError(let url): return "There was an internal server error at \(urlDescription(from: url)). Try again later."
        case .unavailable(let url): return "The service at \(urlDescription(from: url)) is currently unavailable."
        case .noResponse(let url):
            return "There was no response from \(urlDescription(from: url))"
        case .error(let message): return message.localizedDescription
        case .unknown(let message): return message
        case .serialization(codingError: let codingError):
            return "\nWe were unable to decode data returned in an HTTP response. The serialization error should specify the mislabelled or missing key:\n\(codingError.serializationError)\nPlease inspect the response data below to ensure that it matches your object model(s):\n\(codingError.dataString)\n"
        }
    }
    
    
    private func urlDescription(from url: URL?) -> String {
        url.isNil() ? "an unknown endpoint" : String(describing: url)
    }
}
