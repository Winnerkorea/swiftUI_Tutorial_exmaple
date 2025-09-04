//
//  ContentView.swift
//  ViewFundamental
//
//  Created by Baba on 8/25/25.
//

import SwiftUI

struct User: Identifiable{
    let id = UUID()
    let name : String
}

struct ContentView: View{
    
    @State private var Users = [
        
        User(name: "Pooh"),
        User(name: "Tigger"),
        User(name: "Piglet")
    ]
    
    var body: some View{
        VStack{
            ForEach(Users){
                user in Text(user.name)
            }
        }
    }
}


#Preview {
    ContentView()
}
