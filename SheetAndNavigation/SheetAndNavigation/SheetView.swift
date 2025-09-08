//
//  SheetView.swift
//  SheetAndNavigation
//
//  Created by Baba on 9/8/25.
//

import SwiftUI


struct SheetView: View {
    // MARK: - Sheet Close 방법
    // 1. @Environment 사용하기
    //    @Environment(\.dismiss) var dismiss
    // 2. @Binding사용하기
    @Binding var showSheet: Bool
    
    var body: some View {
        Text("Tutorial Sheet Views")
        
        Button("탭해서 닫기(@Enviroment)") {
            //            dismiss()
            showSheet = false
        }
        .frame(width: 300, height: 50)
        .background(Color.blue)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        
    }
}

#Preview {
    SheetView(showSheet: .constant(true))
}
