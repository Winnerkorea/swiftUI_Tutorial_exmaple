//
//  TransactionModel.swift
//  Income
//
//

import Foundation
import SwiftUI
import SwiftData

@Model class TransactionModel{
    // MARK: - Properties
    var id : UUID
    var title: String
    var type: TransactionType
    var amount: Double
    var date: Date
    
    
    //MARK: - Initializer
    init(id: UUID, title: String, type: TransactionType, amount: Double, date: Date){
        // 'self'는 클래스의 프로퍼티를 가리키고,
        // 등호(=) 오른쪽의 값들은 init의 파라미터입니다.
        self.id = id
        self.title = title
        self.type = type
        self.amount = amount
        self.date = date
    }
    
    // MARK: - Computed Properties (Helper)
    // 기존 구조체에 있던 화면 표시용 연산 프로퍼티들도 그대로 가져옵니다.
    var displayDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
    
    func display(currency: Currency) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = currency.locale
        return numberFormatter.string(from: amount as NSNumber) ?? ""
    }
}

struct Transaction: Identifiable {
    
    let id = UUID()
    let title: String
    let type: TransactionType
    let amount: Double
    let date: Date
    
    var displayDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
    
    func display(currency: Currency) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = currency.locale
        return numberFormatter.string(from: amount as NSNumber) ?? ""
    }
    
}

extension Transaction: Hashable {
    
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        lhs.id == rhs.id
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
