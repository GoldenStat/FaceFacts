//
//  EditPersonView.swift
//  FaceFacts
//
//  Created by Alexander Völz on 09.01.24.
//

import SwiftUI
import SwiftData

struct EditPersonView: View {
    @Bindable var person: Person
    
    @Query(sort: [SortDescriptor(\Event.name), SortDescriptor(\Event.location)]) var events: [Event]
    
    @Environment(\.modelContext) var modelContext
    
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        Form {
            Section {
                
                TextField("Name", text: $person.name)
                    .textContentType(.name)
                
                TextField("email address", text: $person.email)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
            }
            
            Section("Where did you meet them?") {
                Picker("Met at", selection: $person.metAt) {
                    Text("Unknown event")
                        .tag(Optional<Event>.none)
                    
                    if !events.isEmpty {
                        Divider()
                        
                        ForEach(events) { event in
                            Text(event.name)
                                .tag(Optional(event))
                        }
                    }
                }
            }
            
            Button("Add a new event", action: addEvent)
            
            Section("Notes") {
                TextField("Details about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationDestination(for: Event.self) { event in
            EditEventView(event: event)
        }
        .navigationTitle("EditPerson")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addEvent() {
        let event = Event(name: "", location: "")
        modelContext.insert(event)
        navigationPath.append(event)
    }
}

//#Preview {
//    EditPersonView()
//}
