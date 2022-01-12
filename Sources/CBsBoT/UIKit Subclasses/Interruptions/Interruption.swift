//
//  Interruption.swift
//  
//
//  Created by Corey Beebe on 1/9/22.
//

typealias Interrupt = Interruption


public struct Interruption {

    let header: InterruptionHeader
    let body: String
    let callToAction: String?
    let secondaryCallToAction: String?
    let action: Closure?
    let secondaryAction: Closure?


    public init(header: InterruptionHeader, body: String,
        callToAction: String? = "OK", secondaryCallToAction: String? = nil,
        action: Closure? = nil, secondaryAction: Closure? = nil) {
        
        self.header = header
        self.body = body
        self.callToAction = callToAction
        self.secondaryCallToAction = secondaryCallToAction
        self.action = action
        self.secondaryAction = secondaryAction
    }
}
