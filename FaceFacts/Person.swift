//
//  Person.swifs
//  FaceFacts
//
//  Created by Alexander Völz on 09.01.24.
//

import SwiftUI
import SwiftData

@Model
class Person {
    var name: String
    var email: String
    var details: String
    var metAt: Event?

    init(name: String, email: String, details: String, metAt: Event? = nil) {
        self.name = name
        self.email = email
        self.details = details
        self.metAt = metAt
    }
}
