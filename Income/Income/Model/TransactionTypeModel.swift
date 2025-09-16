//
//  TransactionType.swift
//  Income
//
//  Created by Baba on 9/15/25.
//

import Foundation


enum TransactionType: String, CaseIterable, Identifiable{
    case income
    case expense
    
    var id: Self {self}
    
    var title: String{
        switch self{
        case .income:
           return "Income"
        case .expense:
           return "Expense"
        }
    }
}
