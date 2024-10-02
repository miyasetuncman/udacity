//
//  Event.swift
//  EventCount2
//
//  Created by Isa Tuncman on 9/27/24.
//

import Foundation
import SwiftUI

struct Event: Identifiable, Comparable {
    
    static func < (lhs: Event, rhs: Event) -> Bool {
            lhs.date < rhs.date
        }
    
    var id = UUID()
    var title: String
    var date = Date()
    var textColor: Color
}
