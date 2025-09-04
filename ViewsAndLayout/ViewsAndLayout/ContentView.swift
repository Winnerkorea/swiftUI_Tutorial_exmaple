//
//  ContentView.swift
//  ViewsAndLayout
//
//  Created by Baba on 8/20/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View{
        VStack{
            Text("Hello, World! asdfasefasefasdfasdfasdf,asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.primary)
                .multilineTextAlignment(.leading)
                .lineSpacing(10.0)
                .lineLimit(1)
                .padding(.horizontal, 10)
        }
    }
}

#Preview {
    ContentView()
}
