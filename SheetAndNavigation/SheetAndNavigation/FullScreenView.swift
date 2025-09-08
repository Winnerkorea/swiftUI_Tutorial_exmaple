//
//  FullScreenView.swift
//  SheetAndNavigation
//
//  Created by Baba on 9/8/25.
//

import SwiftUI

struct FullScreenView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack{
            HStack {
                Spacer() // X 버튼을 오른쪽으로 밀어냅니다.
                Button(action: {
                    //닫기액션
                    dismiss() // 이 뷰를 닫습니다.
                }, label: {
                    Image(systemName: "xmark")
                })
            }
            Spacer()
            Text("This is a full Screen View")
            Spacer()
        }
        .padding()
    }
}

#Preview {
    FullScreenView()
}
