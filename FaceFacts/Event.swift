//
//  Event.swift
//  FaceFacts
//
//  Created by Alexander Völz on 09.01.24.
//

import Foundation
import SwiftData

@Model
class Event {
    var name: String
    var location: String
    var people = [Person]()
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
    
}
