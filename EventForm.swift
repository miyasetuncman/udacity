//
//  EventForm.swift
//  EventCount2
//
//  Created by Isa Tuncman on 9/27/24.
//

import SwiftUI

enum AddorEdit {
    case add, edit(Event)
}

struct EventForm: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var event: Event
    var mode: AddorEdit
    var onSave: (Event) -> Void
    
//    init(event: Event, mode: AddorEdit, onSave: @escaping (Event) -> Void) {
//        self.event = event
//        self.mode = mode
//        self.onSave = onSave
//    }
//    
    var body: some View {
        NavigationStack{
            Form{
                Section(){
                    TextField("Title", text: $event.title)
                        .foregroundColor(event.textColor)
                        .padding()
                    DatePicker("Date", selection: $event.date)
                        .padding()
                    ColorPicker("Color", selection: $event.textColor)
                        .padding()
                }
            }
            .navigationTitle(header)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    if event.title.isEmpty {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "checkmark")
                        })
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    }else {
                        Button(action: {
                            onSave(event)
                            dismiss()
                        }, label: {
                            Image(systemName: "checkmark")
                        })
                    }
                    
                }
            }
        }
        
    }
    
    var header: String {
        switch mode {
        case .add:
            "Add event"
        case .edit(let event):
            "Edit \(event.title)"
        }
    }
    
}

#Preview {
    EventForm(event: Event(title: "Sample event",date: Date(), textColor: .blue), mode: .add, onSave:{
        event in
        print("\(event) saved")
    })
}
