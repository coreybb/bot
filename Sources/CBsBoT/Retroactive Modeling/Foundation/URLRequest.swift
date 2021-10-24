//
//  URLRequest.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import Foundation


public extension URLRequest {
    
    
    typealias NetworkResult <T: Codable> = (_ result: HTTPResult<T>) -> ()
    
    
    //---------------------
    //  MARK: - Public API
    //---------------------
    func getResponse <T: Decodable> (complete: NetworkResult<T>?) {
        
        let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: self) {
            (data, response, error) in
            
            guard let data: Data = data else {
                let message = "The HTTP response contained no data."
                complete?(.error(.unknown(message))); return
            }
            
            if let error: NSError = error as NSError? {
                complete?(.error(.error(error))); return
            }
            
            do {
                complete?(.object(try JSONDecoder().decode(T.self, from: data)))
            
            } catch let serializationError as NSError {
                let dataString: String = String(decoding: data, as: UTF8.self)
                let codingError: CodingError = CodingError(serializationError: serializationError,
                                                           dataString: dataString)
//                                                           type: T.self)
                complete?(.error(.serialization(codingError: codingError)))
            }
        }.resume()
    }
    

    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func http(_ response: URLResponse?, _ message: String? = nil) -> HTTPError {
        
        guard let response: HTTPURLResponse = response as? HTTPURLResponse else {
            return .noResponse
        }
        
        switch response.statusCode  {
        case 200: return .ok
        case 301: return .moved
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 500: return .internalServerError
        case 503: return .unavailable
        default: return .unknown(message ?? "We received unknown status code \(String(describing: response.statusCode)) in the HTTP URL response.")
        }
    }
}


