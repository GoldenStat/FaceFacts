//
//  EditEventView.swift
//  FaceFacts
//
//  Created by Alexander Völz on 09.01.24.
//

import SwiftUI

struct EditEventView: View {
    
    @Bindable var event: Event
    
    var body: some View {
        Form {
            TextField("Name", text: $event.name)
            TextField("Location", text: $event.location)
        }
        .navigationTitle("Edit Event")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditEventView()
//}
