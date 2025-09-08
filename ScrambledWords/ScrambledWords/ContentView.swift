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
    // 1. 유저가 추측한 글자들을 저장할 빈 배열을 @State로 선언합니다.
    @State private var guessedLetters: [LetterModel] = []
    
    // 2. 뷰의 표시 여부를 제어할 두 개의 @State 변수를 선언함
    @State private var showSuccess = false
    @State private var showFailuer = false
    
    // 3.  Score을 표시하기
    @State private var score: Int = 0
    
    // 4. 현재 활성화된 질문이 무엇인지 추적하려면 현재 질문의 인덱스를 저장할 별수
    @State private var currentQuestionIndex = 0
    //    let correctAnswer = "ORANGE"
    
    // 모든 질문을 담을 배열 (상수)
    
    @State private var questions: [QuestionModel] = [
        //1 번 문제: Orange
        QuestionModel(
            image:"orange",
            answer: "ORANGE",
            scrambledLetters: [
                LetterModel(id: 0, text: "O"),
                LetterModel(id: 1, text: "R"),
                LetterModel(id: 2, text: "A"),
                LetterModel(id: 3, text: "N"),
                LetterModel(id: 4, text: "G"),
                LetterModel(id: 5, text: "E")]
            
        ),
        // 2번 문제 : BANANA
        QuestionModel(
            image: "banana",
            answer: "BANANA",
            scrambledLetters: [
                LetterModel(id: 0, text: "B"),
                LetterModel(id: 1, text: "A"),
                LetterModel(id: 2, text: "N"),
                LetterModel(id: 3, text: "A"),
                LetterModel(id: 4, text: "N"),
                LetterModel(id: 5, text: "A")
            ]),
        // 3번 문제 : APPLE
        QuestionModel(
            image: "apple",
            answer: "APPLE",
            scrambledLetters: [
                LetterModel(id: 0, text: "A"),
                LetterModel(id: 1, text: "P"),
                LetterModel(id: 2, text: "P"),
                LetterModel(id: 3, text: "L"),
                LetterModel(id: 4, text: "E")
            ])
    ]
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Spacer()
                        Image(questions[currentQuestionIndex].image)
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
                                            questions[currentQuestionIndex].scrambledLetters[guessedLetter.id].text = guessedLetter.text
                                        }
                                    }
                            }
                            
                        }
                        .padding(.bottom)
                    }
                    .frame(width: proxy.size.width * 0.9, height: proxy.size.width * 0.9)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.border, lineWidth: 2))
                    
                    Text("Score : \(score)")
                        .foregroundStyle(.white)
                        .font(.system(size: 15))
                        .padding(.top)
                    
                    HStack{
                        // letter 배열이 아닌, 현재 활성화된 질문의 ScrambeldLetters 배열을 순회해야 한다.
                        ForEach(Array(questions[currentQuestionIndex].scrambledLetters.enumerated()), id: \.1){
                            (index, letter) in
                            LetterView(letter: letter)
                                .onTapGesture {
                                    // 글자가 비어있지 않을 때만 로직을 실행
                                    if !letter.text.isEmpty{
                                        guessedLetters.append(letter)
                                        questions[currentQuestionIndex].scrambledLetters[index].text = ""
                                        //  onTapGesture 내부, 문자를 옮기는 로직 직후
                                        if guessedLetters.count == questions[currentQuestionIndex].scrambledLetters.count{
                                            
                                            let guessedAnswer = guessedLetters.map{$0.text}.joined()
                                            
                                            if guessedAnswer == questions[currentQuestionIndex].answer{
                                                print("정답입니다.")
                                                showSuccess = true
                                                
                                                score += 1
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                    showSuccess = false
                                                    guessedLetters.removeAll()
                                                    
                                                    
                                                    if currentQuestionIndex == questions.count - 1 {
                                                        // 다음 문제로 인텍스로 이동
                                                        
                                                    } else {
                                                        currentQuestionIndex += 1
                                                        
                                                    }
                                                }
                                                
                                            } else {
                                                print("오답입니다.")
                                                showFailuer = true
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                    showFailuer = false
                                                    
                                                    if currentQuestionIndex == questions.count - 1 {
                                                        
                                                    } else {
                                                        currentQuestionIndex += 1
                                                    }
                                                    
                                                    guessedLetters.removeAll()
                                                    currentQuestionIndex += 1 // 다음 문제롤 인텍스 이동.
                                                }
                                                
                                            }
                                            guessedLetters.removeAll()
                                        }
                                    }
                                }
                        }
                    }
                }
                
                
                if showSuccess{
                    VStack {
                        Image("tick")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    .frame(maxWidth:.infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3))
                }
                
                if showFailuer{
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
