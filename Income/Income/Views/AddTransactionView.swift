//
//  AddTransactionView.swift
//  Income
//
//  Created by Baba on 9/16/25.
//

import SwiftUI

struct AddTransactionView: View {
    
    @State private var amount: Double = 0.0
    @State private var selectedTransactionType: TransactionType = .expense // 새 상태 변수
    
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
    var body: some View {
        
        VStack{
            TextField("0.00", value: $amount, formatter: numberFormatter)
                .font(.system(size: 60, weight: .thin))
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
            
            Picker("Choose Type", selection: $selectedTransactionType) {
                // 옵션 콘텐츠가 여기에 들어갑니다.
                ForEach(TransactionType.allCases) { transactionType in
                    // 각 케이스를 어떻게 표시할지 여기에 작성
                    Text(transactionType.title)
                        .tag(transactionType)
                }
            }
            
            Spacer()
        }

    }
}

#Preview {
    AddTransactionView()
}
