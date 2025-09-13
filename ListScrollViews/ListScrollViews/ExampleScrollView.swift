//
//  ExampleScrollView.swift
//  ListScrollViews
//
//  Created by Winnerkorea on 9/13/25.
//

import SwiftUI

struct ExampleScrollView: View {
    var body: some View {
        ScrollView(.vertical) {
            HStack{
                Text("Item 1")
                Text("Item 2")
            }
        }
    }
}

#Preview {
    ExampleScrollView()
}
