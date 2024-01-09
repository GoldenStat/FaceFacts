//
//  Item.swift
//  FaceFacts
//
//  Created by Alexander Völz on 09.01.24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
