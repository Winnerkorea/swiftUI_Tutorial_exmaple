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
    @State private var transactionTitle: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    @Binding var transaction: [Transaction]
    
    @Environment(\.dismiss) var dismiss
    
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
            
            // --- 구분선 ----
            Rectangle()
                .frame(height: 0.5)
                .padding(.horizontal, 30)
                .foregroundStyle(Color(uiColor: .lightGray))
            
            Picker("Choose Type", selection: $selectedTransactionType) {
                // 옵션 콘텐츠가 여기에 들어갑니다.
                ForEach(TransactionType.allCases) { transactionType in
                    // 각 케이스를 어떻게 표시할지 여기에 작성
                    Text(transactionType.title)
                        .tag(transactionType)
                }
            }
            
            
            
            // --- 제목 Text Field ---
            
            TextField("Title", text: $transactionTitle)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 30)
                .padding(.top)
            
            
            //  -- 생성 버튼 ---
            Button{
                // Create Button - Todo: 생성 액션
                // 1. 입력값 검증
                guard transactionTitle.count >= 2 else {
                    alertTitle = "Invalid Title"
                    alertMessage = "Title must be two or more charactres"
                    showAlert = true
                    return
                }
                
                // {검증 통과 후 로직}
                // 2. Transaction 객체 생성
                let newTransaction = Transaction(
                    title: transactionTitle,
                    type: selectedTransactionType,
                    amount: amount,
                    date: Date()
                )
                
                // 3. 배열에 새 객체 추가
                transaction.append(newTransaction)
                
                // 4. 현재 뷰 닫기
                dismiss()
                
                
            } label:{
                Text("Create")
                    .font(.system(size: 15, weight:.semibold))
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .padding(.horizontal, 30)
            }
            
            Spacer()
        }
        .padding(.top)
        .alert(alertTitle, isPresented: $showAlert) {
            
            Button("OK", role: .cancel) {
                // 경고 메세지에 대한 버튼 액션
            }

       
        } message: {
            Text(alertMessage)
        }


    }
}

#Preview {
    AddTransactionView(transaction: .constant([])) // 상수 배열 전달
}
