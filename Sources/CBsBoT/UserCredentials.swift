//
//  UserCredentials.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import Foundation



/// A simple objects that encapsulates user credentials, allowing for quick validation of a username and password.
public struct UserCredentials {
    
    
    let username: String
    let password: String
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    
    
    //---------------------
    //  MARK: - Public API
    //---------------------
    func areValid() -> Bool {
        
        guard credentialsAreMoreThanWhitespace(),
              usernameIsValidEmail() else { return false }
        return true
    }
    
    
    
    //---------------------
    //  MARK - Private API
    //---------------------
    private func credentialsAreMoreThanWhitespace() -> Bool {
        
        return !username.noHangingWhiteSpace.isEmpty
            && !password.noHangingWhiteSpace.isEmpty
    }
    
    
    private func usernameIsValidEmail() -> Bool {
        
        guard let dataDetector: NSDataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else { return false }
        
        let range: NSRange = NSMakeRange(0, NSString(string: username).length)
        let allMatches: [NSTextCheckingResult] = dataDetector.matches(in: username,
                                              options: [], range: range)
        
        if allMatches.count == 1, allMatches
            .first?.url?.absoluteString
            .contains("mailto:") == true { return true }
        
        return false
    }
}
