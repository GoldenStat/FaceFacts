//
//  ContentView.swift
//  FaceFacts
//
//  Created by Alexander Völz on 09.01.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var path = NavigationPath()
    @State private var searchText = ""
    
    @State private var sortOrder = [SortDescriptor(\Person.name)]
    
    var body: some View {
        NavigationStack(path: $path) {
            PeopleView(searchString: searchText, sortOrder: sortOrder)
                .navigationTitle("FaceFacts")
                .navigationDestination(for: Person.self) { person in
                    EditPersonView(person: person, navigationPath: $path)
                }
                .toolbar {
                    Button("Add Person", systemImage: "plus", action: addPerson)
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name (A-Z)")
                                .tag([SortDescriptor(\Person.name)])
                            Text("Name (Z-A)")
                                .tag([SortDescriptor(\Person.name, order: .reverse)])
                            
                        }
                    }
                }
                .searchable(text: $searchText)
            
            Text("Select a person")
        }
    }

    private func addPerson() {
        withAnimation {
            let newPerson = Person(name: "", email: "", details: "")
            modelContext.insert(newPerson)
            path.append(newPerson)
        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Person.self, inMemory: true)
}
