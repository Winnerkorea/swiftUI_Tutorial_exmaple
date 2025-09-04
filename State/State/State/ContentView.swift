//
//  ContentView.swift
//  State
//
//  Created by Baba on 8/22/25.
//

import SwiftUI

//1. SwfitUI manages the storage of the property.

struct ContentView: View {
    
    @State var counter : Int = 0
    

    
    var body: some View {
        VStack {
           
            Text("\(counter)")
            Button(action: {
                
                counter += 1
                
            }, label:{ Text("Increase Counter")})

        }
        
    }
}

#Preview {
    ContentView()
}
