//
//  ContentView.swift
//  TapGame
//
//  Created by Baba on 8/26/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var currentPickIndex = 0
    @State private var targetIndex = 1
    @State private var score: Int = 0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert: Bool = false
    @State private var difficulty : Difficulty = .easy
    @State private var isGameRunning = true
    
    
    let possiblePics: [String] = ["apple", "dog", "cat"]
    var randomTarget: Int {
        return Int.random(in: 0..<possiblePics.count)
    }
    
    enum Difficulty: Double{
        case easy = 1, medium = 0.5, hard = 0.1
        
        var title: String {
            switch self {
            case .easy:
                return "Easy"
            case .medium:
                return "Medium"
            case .hard:
                return "Hard"
            }
        }
    }
    
    var body: some View {
        VStack {
            
            HStack {
                if !isGameRunning{
                    Menu("Difficulty \(difficulty.title)") {
                        Button(Difficulty.easy.title, action: {
                            difficulty = .easy
                        })
                        Button(Difficulty.medium.title, action: {
                            difficulty = .medium
                        })
                        Button(Difficulty.hard.title, action: {
                            difficulty = .hard
                        })
                    }
                  
                }
                Spacer()
                Text("Score : \(score)")
                
            }
            .padding(.horizontal)
            
            
            Image(possiblePics[currentPickIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .onTapGesture {
                    isGameRunning = false
                    timer.upstream.connect().cancel()
                    if currentPickIndex == targetIndex {
                        score += 1
                        alertTitle = "Success!"
                        alertMessage = "You got the correct answer!"
                    } else {
                        alertTitle = "Incorrect."
                        alertMessage =  "You chose the wrong answer"
                    }
                    showAlert = true
                }
            Text(possiblePics[targetIndex])
                .font(.headline)
                .padding(.top)
            
            if !isGameRunning {
                Button("Restart Game", action: {
                    isGameRunning = true
                    targetIndex = randomTarget
                    timer = Timer.publish(every: difficulty.rawValue, on: .main, in: .common).autoconnect()
                })
            }
          
            
        }
        .onReceive(timer, perform: { _ in
            changePic()
        })
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", action: {
                showAlert = false
            })
        } message: {
            Text(alertMessage)
        }
        
        
    }
    func changePic() {
        if currentPickIndex == possiblePics.count - 1 {
            currentPickIndex = 0
        } else {
            currentPickIndex += 1
        }
    }
}

#Preview {
    ContentView()
}
