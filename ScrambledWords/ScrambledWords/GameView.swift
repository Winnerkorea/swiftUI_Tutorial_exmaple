//
//  ContentView.swift
//  ScrambledWords
//
//  Created by Baba on 8/26/25.
//

import SwiftUI
//Hashable

struct GameView: View {
    //    @State private var letters = ["O", "R","A","N","G","E"]
    // Alert Message Variables
    // 1. 유저가 추측한 글자들을 저장할 빈 배열을 @State로 선언합니다.
    @State private var guessedLetters: [LetterModel] = []
    
    // 2. 뷰의 표시 여부를 제어할 두 개의 @State 변수를 선언함
    @State private var showSuccess = false
    @State private var showFailure = false
    
    // 3.  Score을 표시하기
    @State private var score: Int = 0
    
    // 4. 현재 활성화된 질문이 무엇인지 추적하려면 현재 질문의 인덱스를 저장할 별수
    @State private var currentQuestionIndex = 0
    //    let correctAnswer = "ORANGE"
    
    // 5. GameView에서 ScoreView에 모달 띄우기 위한 상태 변수 추가
    @State private var showFinalScore = false
    
    // 모든 질문을 담을 배열 (상수)
    
    @State private var questions: [QuestionModel] = QuestionModel.generateQuestions()
    
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
                                                    
                                                    
                                                    if currentQuestionIndex == questions.count - 1 {
                                                        showFinalScore = true
                                                        
                                                    } else {
                                                        currentQuestionIndex += 1
                                                        
                                                    }
                                                }
                                                
                                            } else {
                                                print("오답입니다.")
                                                showFailure = true
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                    showFailure = false
                                                    
                                                    if currentQuestionIndex == questions.count - 1 {
                                                        showFinalScore = true
                                                    } else {
                                                        currentQuestionIndex += 1
                                                    }
                                                    
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
                
                if showFailure{
                    VStack {
                        Image("close")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    .frame(maxWidth:.infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3))
                }
                
            }
            .sheet(isPresented: $showFinalScore) {
                // 여기에 재시작 로직 추가 예정
                questions = QuestionModel.generateQuestions()
                currentQuestionIndex = 0
                score = 0
            } content: {
                // 여기에 보여줄 뷰를 지정
                ScoreView(score: score, quesionCount: questions.count)
            }
        }
        
    }
    
}


#Preview {
    GameView()
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
