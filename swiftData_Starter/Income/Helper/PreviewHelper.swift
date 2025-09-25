//
//  PreviewHelper.swift
//  Income
//
//  Created by Baba on 9/24/25.
//

import Foundation
import SwiftData

@MainActor // 💡 main 스레드에서 코드가 실행되도록 보장합니다.
class PreviewHelper {

    // static으로 선언하여 인스턴스 생성 없이 타입 자체로 접근 가능하게 합니다.
    static let previewContainer: ModelContainer = {
                    // 1. ModelConfiguration을 생성하고, isStoredInMemoryOnly를 true로 설정합니다.
            // 이것이 데이터를 디스크가 아닌 메모리에만 저장하도록 하는 핵심 설정입니다.
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            
                        // 2. 위에서 만든 설정을 사용하여 ModelContainer를 생성합니다.
            // ModelContainer 생성은 실패할 수 있으므로 'try'와 'do-catch'를 사용합니다.
        do {

            let container = try ModelContainer(for: TransactionModel.self, configurations: config)

            // 3. (선택사항) 프리뷰에 기본적으로 보일 더미(dummy) 데이터를 추가합니다.
            let transaction = TransactionModel(id: UUID(), title: "Lunch", type: .expense, amount: 5, date: Date())

            container.mainContext.insert(transaction)
            
            // 4. 성공적으로 생성된 컨테이너를 반환합니다.
            return container

        } catch {
            // 5. 컨테이너 생성에 실패하면 개발자가 즉시 알 수 있도록 앱을 강제 종료합니다.
            fatalError("프리뷰를 위한 모델 컨테이너 생성에 실패했습니다.")
        }
    }()
}
