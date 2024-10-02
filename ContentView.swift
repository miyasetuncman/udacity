//
//  ContentView.swift
//  EventCount2
//
//  Created by Isa Tuncman on 9/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        EventsView(events: [Event(title: "Sample event",date: Date(), textColor: .blue)])
    }
}

#Preview {
    ContentView()
}
