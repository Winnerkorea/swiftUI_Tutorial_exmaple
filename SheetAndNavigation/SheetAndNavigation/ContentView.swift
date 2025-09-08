//
//  ContentView.swift
//  SheetAndNavigation
//
//  Created by Baba on 9/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSheet = false
    
    
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
//            Button("Sheet") {
//                print("Click The Button")
//                showSheet = true
//            }
        }
        .sheet(isPresented: $showSheet, content: {
            SheetView(showSheet: $showSheet)
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
