//
//  HTTPResult.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//


public enum HTTPResult <T: Codable> {
    
    case object(T)
    case error(HTTPError)
}
