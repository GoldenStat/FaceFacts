//
//  PeopleView.swift
//  FaceFacts
//
//  Created by Alexander Völz on 09.01.24.
//

import SwiftUI
import SwiftData

struct PeopleView: View {
    
    @Environment (\.modelContext) private var modelContext
    @Query private var people: [Person]
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Person>] = []) {
            _people = Query(filter: #Predicate { person in
                if searchString.isEmpty {
                    true
                } else {
                    person.name.contains(searchString)
                }
            }, sort: sortOrder)
        
    }
    var body: some View {
        List {
            ForEach(people) { person in
                NavigationLink(value: person) {
                    Text(person.name)
                }
            }
            .onDelete(perform: deletePeople)
        }
    }
    
    private func deletePeople(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(people[index])
            }
        }
    }

}

#Preview {
    PeopleView()
}
