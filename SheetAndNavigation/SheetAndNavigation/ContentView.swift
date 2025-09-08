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
    @State private var showPresentaionDetent = false
    @State private var presentFullScreen = false
    
    
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
            
            Divider()
            
            Button(action: {
                showPresentaionDetent = true
            }, label: {
                Text("디덴트로 시트 표시")
            })
            
            Divider()
            
            Button(action: {
                presentFullScreen = true
            }, label: {
                Text("Full Screen으로 시트 표시")
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
        .sheet(isPresented: $showPresentaionDetent) {
            PresentaionDetentView()
//                .presentationDetents([.fraction(0.75)]) //  화면 높이의 25%
//                .presentationDetents([.height(250)]) // 250 포인트 높이
        }
        .fullScreenCover(isPresented: $presentFullScreen) {
            FullScreenView()
        }
        
    }
}

#Preview {
    ContentView()
}
