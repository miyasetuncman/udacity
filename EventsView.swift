//
//  EventsView.swift
//  EventCount2
//
//  Created by Isa Tuncman on 9/27/24.
//

import SwiftUI

struct EventsView: View {
    
   @State var events: [Event]
    
    var body: some View {
        NavigationStack{
            List(events.indices, id:\.self){index in
                NavigationLink(destination: EventForm(event: events[index], mode: .edit(events[index]), onSave: {
                    newEvent in
                    updateEvent(newEvent, at: index)
                })) {
                    EventRow(event: events[index])
                        .swipeActions{
                            Button("Delete") {
                                events.remove(at: index)
                            }
                            .tint(.red)
                        }
                }
                
                
            }
            .navigationTitle("Events")
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    NavigationLink(destination: EventForm(event: Event(title: "", textColor: .blue), mode: .add, onSave: saveEvent)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    func saveEvent(_ event: Event){
        events.append(event)
       
    }
    
    func updateEvent(_ newEvent: Event, at index: Int){
        events[index] = newEvent
        
        
    }
}

#Preview {
    EventsView(events: [Event(title: "Sample event",date: Date(), textColor: .blue)])
}
