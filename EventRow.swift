//this is the one you should work on, no errros
//
//  EventRow.swift
//  EventCount2
//
//  Created by Isa Tuncman on 9/27/24.
//

import SwiftUI

struct EventRow: View {
    
    var event : Event
    @State var formattedDate: String = ""
    
    @State private var timer: Timer?
    
    var body: some View {
        VStack(alignment: .leading){
            Text(event.title)
                .font(.headline)
                .foregroundStyle(event.textColor)
            Text(formattedDate)
                .font(.subheadline)
        }
        .onAppear {
            updateFormattedDate()
            startTimer()
        }
        .onDisappear {
            timer?.invalidate()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding()
    }
    
    func updateFormattedDate(){
        let formatter = RelativeDateTimeFormatter()
        formattedDate = formatter.localizedString(for: event.date, relativeTo: Date())
        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true, block: { _ in
            updateFormattedDate()
        })
    }
}

#Preview {
    EventRow(event: Event(title: "Sample event",date: Date(), textColor: .blue))
}


