//
//  IncomeApp.swift
//  Income
//
//

import SwiftUI

@main
struct IncomeApp: App {
    
    // DataManager의 싱글턴 인스턴스를 가져옵니다.    
    let dataManager = DataManager.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
            // \.managedObjectContext 라는 키 경로에
            // dataManager의 viewContext를 값으로 주입합니다.
                .environment(\.managedObjectContext, dataManager.container.viewContext)
            
        }
    }
}
