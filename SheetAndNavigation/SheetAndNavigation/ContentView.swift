//
//  ContentView.swift
//  SheetAndNavigation
//
//  Created by Baba on 9/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSheet = false
    @State private var backgroundColor = Color.blue
    
    
    
    var body: some View {
        ZStack {
            
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Button("Sheet") {
                    print("Click The Button")
                    showSheet = true
                }
                .frame(maxWidth:300, maxHeight: 50)
                .background(Color(.yellow))
                .foregroundStyle(.white)
                .fontWeight(.bold)
            }
        }
        .background(backgroundColor)
        .sheet(isPresented: $showSheet, onDismiss: {
            // 이 코드는 시트가 닫힌 후에 실행됩니다.
            backgroundColor = .yellow
        }, content: {
            SheetView(showSheet: $showSheet)
        })
    }
}

#Preview {
    ContentView()
}
