//
//  ContentView.swift
//  StateBinding
//
//  Created by Baba on 8/25/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var counter: Int = 0
    
    var body: some View {
        VStack {
            
            Text("Counter:\(counter)")
            SubView(counter: $counter)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct SubView: View {
    
    @Binding var counter: Int
    
    var body: some View {
        Text("\(counter) From subView")
        Button("Increase Counter"){
            self.counter += 1
        }
    }
}
