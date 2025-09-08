//
//  QuestionModel.swift
//  ScrambledWords
//
//  Created by Baba on 9/6/25.
//

import Foundation


struct QuestionModel {
    let image: String
    let answer: String
    var scrambledLetters: [LetterModel]
}



// MARK: - Generates Questions
// 질문 배열을 생성해서 반환하는 정석 함수 추가
// 게임을 재시작 하면, questions 배열, currentQuestionIndex, score를 모두 초기 상태로 만들어야 함

extension QuestionModel {
    // 'Static' 키워드를 사용하여 이 함수를 타입 자체에 속하게 만듬
    static func generateQuestions() -> [QuestionModel] {
        // GameView에 있던 질문 배열 전체를 복사해서 여기에 붙여넣기
        return [
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
    }
}
