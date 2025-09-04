//
//  ContentView.swift
//  ScrambledWords
//
//  Created by Baba on 8/26/25.
//

import SwiftUI

//Hashable

struct ContentView: View {
    //    @State private var letters = ["O", "R","A","N","G","E"]
    // Alert Message Variables
    
    @State private var letters:[LetterModel] = [
        LetterModel(id: 0, text: "O"),
        LetterModel(id: 1, text: "R"),
        LetterModel(id: 2, text: "A"),
        LetterModel(id: 3, text: "N"),
        LetterModel(id: 4, text: "G"),
        LetterModel(id: 5, text: "E")
    ]
    // 1. 유저가 추측한 글자들을 저장할 빈 배열을 @State로 선언합니다.
    @State private var guessedLetters: [LetterModel] = []
    
    let correctAnswer = "ORANGE"
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Spacer()
                        Image("orange")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Spacer()
                        
                        HStack {
                            
                            
                            ForEach(guessedLetters){guessedLetter in
                                LetterView(letter: guessedLetter)
                                    .onTapGesture {
                                        if  let index = guessedLetters.firstIndex(of: guessedLetter)
                                        {guessedLetters.remove(at: index)
                                            letters[guessedLetter.id].text = guessedLetter.text
                                        }
                                    }
                            }
                            
                        }
                        .padding(.bottom)
                    }
                    .frame(width: proxy.size.width * 0.9, height: proxy.size.width * 0.9)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.border, lineWidth: 2))
                    
                    Text("Score : 0")
                        .foregroundStyle(.white)
                        .font(.system(size: 15))
                        .padding(.top)
                    
                    HStack{
                        
                        ForEach(Array(letters.enumerated()), id: \.1){
                            (index, letter) in
                            LetterView(letter: letter)
                                .onTapGesture {
                                    // 글자가 비어있지 않을 때만 로직을 실행
                                    if !letter.text.isEmpty{
                                        guessedLetters.append(letter)
                                        letters[index].text = ""
                                        //  onTapGesture 내부, 문자를 옮기는 로직 직후
                                        if guessedLetters.count == letters.count{
                                            // 이 시점에서 정답/오답을 평가합니다.
//                                            var guessedAnswer = ""
//                                            
//                                            for letter in guessedLetters{
//                                                
//                                                guessedAnswer += letter.text
//                                            }
                                            
                                            let guessedAnswer = guessedLetters.map{$0.text}.joined()
                                            
                                            if guessedAnswer == correctAnswer{
                                                print("정답입니다.")
                                            } else {
                                                print("오답입니다.")
                                              
                                            }
                                        }
                                    }
                                }
                        }
                    }
                }
                
                VStack {
                    Image("close")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.3))
            }
        }
     

    }
}

#Preview {
    ContentView()
}

struct LetterView: View {
    
    let letter: LetterModel  // 글자를 전달받을 상수 프로퍼티
    var body: some View {
        Text(letter.text)    // 하드코딩된 "O" 대신 프로퍼티 사용
            .font(.system(size: 15, weight: .semibold))
            .frame(width: 30, height: 30)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .foregroundStyle(Color.white)
    }
}
