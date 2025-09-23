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
    
    // 1. 초기화 메서드를 private으로 선언합니다.
    private init() {
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Core Data가 저장소를 로드하는 데 실패했습니다: \(error.localizedDescription)")
            }
        }
    }
}
