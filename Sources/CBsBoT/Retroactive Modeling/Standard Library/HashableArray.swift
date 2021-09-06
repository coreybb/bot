//
//  HashableArray.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

public extension Array where Element: Hashable {
    
    
    /// Returns the symmetric difference, or unshared elements, of two arrays.
    func disjunctiveUnion(from other: [Element]) -> [Element] {

        Array(Set(self).symmetricDifference(Set(other)))
    }
    
    
    func removingDuplicates() -> [Element] {
        
        var addedDict: [Element : Bool] = [Element : Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    
    private mutating func removeDuplicates() {
        
        self = self.removingDuplicates()
    }
}
