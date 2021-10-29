//
//  DelegateMulticaster.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import Foundation


/// A group communication object allowing for simultaneous transmission of data or events using a one-to-many modification of the delegation pattern.  By subclassing an existing protocol, a delegate multicast class can instantiate and serve as a wrapper for a `DelegateMulticaster` object, thereby converting a traditionally one-to-one communication pattern into a one-to-many communication pattern. Specify which protocol the multicaster should delegate as a generic type parameter upon instantiation.
open class DelegateMulticaster<T> {

    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let delegates: NSHashTable<AnyObject> = NSHashTable.weakObjects()

    
    /// Subscribes new delegates to the multicast. Call this function in your delegate multicaster class with a memberwise initializer accepting an array of delegates conforming to the desired protocol, or expose it publicly as a function within the class. In conforming to the desired protocol, delegates subscribed to the `DelegateMulticaster` will receive data and events as they are called by whichever object owns the delegate multicast wrapper class.
    func add(_ delegate: T) {
        
        delegates.add(delegate as AnyObject)
    }

    /// Removes delegates from the multicast.
    func remove(_ delegateToRemove: T) {
        
        delegates.allObjects.reversed().forEach {
            if $0 === delegateToRemove as AnyObject {
                delegates.remove($0)
            }
        }
    }

    /// Invokes a multicast, taking a closure expression as an argument, which itself takes a generic argument of the protocol type parameter `T` defined at initialization, upon which any functions or methods defined in the protocol can be executed.
    func invoke(_ invocation: (T) -> (Void)) {
        
        delegates.allObjects.reversed().forEach {
            invocation($0 as! T)
        }
    }
}
