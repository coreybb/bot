//
//  String.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//


import UIKit


public extension String {
    
    
    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    var alphanumeric: String {
        components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
    }
    
    var noHangingWhiteSpace: String {
        removeHangingWhiteSpace(self)
    }
    

    
    //---------------------
    //  MARK: - Public API
    //---------------------
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        
        let constraintRect: CGSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox: CGRect = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
    
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
         let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

         return ceil(boundingBox.width)
     }

    
    func camelCaseToWords() -> String {

        let emptyString: String = ""
        
        return unicodeScalars.reduce(emptyString) {

            if CharacterSet.uppercaseLetters.contains($1) {
                return "\($0) \(String($1))"
            }

            return "\($0)\(String($1))"
        }
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func removeHangingWhiteSpace(_ string: String) -> String {

        var string: String = string
       
        guard string.last != " " else {
            string.removeLast()
            return removeHangingWhiteSpace(string)
        }

        return string
    }
}
