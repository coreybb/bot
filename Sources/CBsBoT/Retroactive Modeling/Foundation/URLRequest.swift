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
        
        URLSession(configuration: URLSessionConfiguration.default)
            .dataTask(with: self) {
                (data, response, error) in
            
            if response.isNil() {
                complete?(.error(.noResponse(url))); return
            }

            guard let data: Data = data else {
                
                var urlString: String {
                    guard let url: URL = url else { return "an unknown endpoint"}
                    return String(describing: url)
                }
                
                let message: String = "The server at \(urlString) returned an HTTP response, but it contained no data."
                complete?(.error(.unknown(message))); return
            }
            
            if let error: NSError = error as NSError? {
                complete?(.error(.error(error))); return
            }
            
            do {
                let dataString: String = String(decoding: data, as: UTF8.self)
                print(dataString)
                complete?(.object(try JSONDecoder().decode(T.self, from: data)))
            
            } catch let serializationError as NSError {
                
                let dataString: String = String(decoding: data, as: UTF8.self)
                let codingError: CodingError = CodingError(serializationError: serializationError,
                                                           dataString: dataString)
                complete?(.error(.serialization(codingError: codingError)))
            }
        }.resume()
    }
    


    //----------------------
    //  MARK: - Private API
    //----------------------
    private func http(_ response: URLResponse?, _ message: String? = nil) -> HTTPError {
        
        guard let response: HTTPURLResponse = response as? HTTPURLResponse else {
            return .noResponse(url)
        }
        
        switch response.statusCode  {
        case 200: return .ok
        case 301: return .moved(url)
        case 400: return .badRequest(url)
        case 401: return .unauthorized(url)
        case 403: return .forbidden(url)
        case 404: return .notFound(url)
        case 500: return .internalServerError(url)
        case 503: return .unavailable(url)
        default: return .unknown(message ?? "We received unknown status code \(String(describing: response.statusCode)) in the HTTP URL response.")
        }
    }
}
