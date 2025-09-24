//
//  IncomeApp.swift
//  Income
//
//
/*
 
 1. SwfitData을 Import 합니다.
 2. .modelContainer 수정자를 'for' 파라미터에 사용할 모델 타입의 배열을 전달합니다.
 
 */

import SwiftUI
import SwiftData // 1. SwiftData를 Import합니다.

@main
struct IncomeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: [TransactionModel.self])
    }
}
