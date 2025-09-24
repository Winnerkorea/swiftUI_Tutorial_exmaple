//
//  DataManager.swift
//  Income
//
//  Created by Baba on 9/23/25.
//

import Foundation
import CoreData


//Singleton
class DataManager {
    
    let container = NSPersistentContainer(name: "incomeData")
    // 2. static 상수를 통해 유일한 인스턴스를 생성하고 공유합니다.
    static let shared = DataManager()
    
    static var sharedPreview: DataManager{
        let manager = DataManager(inMemory: true)
        // 더미 트랙잭션 생성
        let transaction = TransactionItem(context: manager.container.viewContext)
        transaction.title = "Dummy"
        transaction.amount = 100
        transaction.type = Int16(TransactionType.expense.rawValue)
        transaction.date = Date()
        transaction.id = UUID()
        return manager

    }
    
    // 1. 초기화 메서드를 private으로 선언합니다.
    private init(inMemory: Bool = false) {
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Core Data가 저장소를 로드하는 데 실패했습니다: \(error.localizedDescription)")
            }
        }
    }
}
