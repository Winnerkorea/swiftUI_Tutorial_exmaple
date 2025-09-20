//
//  Extension+View.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 24/5/2024.
//

import Foundation
import SwiftUI

extension View {
    
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
}
