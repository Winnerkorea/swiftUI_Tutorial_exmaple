//
//  ContentView.swift
//  SheetAndNavigation
//
//  Created by Baba on 9/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSheet = false
    @State private var person: Person?
    
    
    var body: some View {
        VStack(alignment: .leading){
            Button(action: {
                showSheet = true
            }, label: {
                Text("Boolean으로 시트 표시")
            })
            
            Divider()
            
            Button(action: {
                person = Person(name: "홍길동")
            }, label: {
                Text("Item으로 시트 표시")
            })
           Spacer()
           
        }
        .padding(.horizontal)
        .padding(.top, 40)
        .sheet(isPresented: $showSheet, content: {
            SheetView(showSheet: $showSheet)
        })
        .sheet(item: $person) { person in
            SheetItemView(person: person)
        }
        
    }
}

#Preview {
    ContentView()
}
