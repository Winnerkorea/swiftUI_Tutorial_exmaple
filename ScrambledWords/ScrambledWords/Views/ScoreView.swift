//
//  ScoreView.swift
//  ScrambledWords
//
//  Created by Baba on 9/8/25.
//

import SwiftUI

struct ScoreView: View {
    
    let score: Int
    let quesionCount: Int
    
    var body: some View {
        ZStack {
            //1. 게임 화면과 동일한 배경색 설정
            Color("background")
                .ignoresSafeArea()
            VStack{
            // 2. 제목 텍스트
                Text("Final Score")
                    .foregroundStyle(.white)
                    .font(.system(size: 26, weight: .bold))
            
            // 3. 점수 텍스트(추후 추가)
                Text("\(score) / \(quesionCount)")
                    .foregroundStyle(.white)
            }
        }
    }
}



#Preview {
    ScoreView(score: 2, quesionCount: 3)
}
