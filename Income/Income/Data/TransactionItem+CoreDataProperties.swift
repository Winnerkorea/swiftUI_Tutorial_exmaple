//
//  TransactionItem+CoreDataProperties.swift
//  Income
//
//  Created by Baba on 9/23/25.
//
//

import Foundation
import CoreData


extension TransactionItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionItem> {
        return NSFetchRequest<TransactionItem>(entityName: "TransactionItem")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var type: Int16
    @NSManaged public var amount: Double
    @NSManaged public var date: Date?

}

extension TransactionItem : Identifiable {

}

// TransactionItem+CoreDataProperties.swift (새 파일 또는 기존 파일 하단에 추가)

extension TransactionItem {

    // UUID? -> UUID
    // id는 거래에 필수적이므로, 만약 없다면 크래시를 발생시켜 문제를 즉시 인지하게 합니다.
    var wrappedId: UUID {
        id!
    }

    // String? -> String
    // title이 nil일 경우, 빈 문자열("")을 기본값으로 반환합니다.
    var wrappedTitle: String {
        title ?? ""
    }
    
    // Date? -> Date
    // date가 nil일 경우, 현재 날짜를 기본값으로 반환합니다.
    var wrappedDate: Date {
        date ?? Date()
    }
    
    // Double -> Double (옵셔널이 아니므로 그대로 반환)
    // 기존 amount 자체가 non-optional이므로 래핑이 필요 없지만, 일관성을 위해 만듭니다.
    var wrappedAmount: Double {
        amount
    }

    // Int16 -> TransactionType (Enum)
    // 저장된 정수(Int16)를 TransactionType 열거형으로 변환합니다.
    // 변환에 실패할 경우(예: 0 또는 1이 아닌 값), 기본값으로 .expense를 반환합니다.
    var wrappedTransactionType: TransactionType {
        TransactionType(rawValue: Int(type)) ?? .expense
    }
}
