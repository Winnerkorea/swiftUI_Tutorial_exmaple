//
//  TransactionModel.swift
//  Income
//
//  Created by Baba on 9/15/25.
//

import Foundation

struct Transaction: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let type: TransactionType
    let amount: Double
    let date: Date
    var displayDate: String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    var displayAmount: String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        
        // Double 타입을 NSNumber로 형 변환
        let amountAsNumber = amount as NSNumber
        
        // 포멧팅 후 옵션 처리
        return formatter.string(from: amountAsNumber) ?? ""
    }
}
