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
    
    var transactionToEdit : Transaction? // 수정할 데이터를 받을 프로퍼티 추가
    
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
                
                // 3. 수정과 추가에 대한 로직을 생성해야 함
                
                if let transactionToEdit{
                    // --- 수정 로직 ---
                    // transactionToEdit 값이 있으면 이 블록 실행
                    // 1. 배열에서 수정할 항목의 인텍스를 찾는다.
                    guard let index = transaction.firstIndex(of: transactionToEdit) else {
                        alertTitle = "Something went wrong"
                        alertMessage = "Cannot update this transaction right now"
                        showAlert = true
                        return
                    }
                    // 2. 해당 인텍스의 항목을 새로운 내용으로 교체한다.
                    transaction[index] = newTransaction
                } else {
                    // --- 추가 로직 ---
                    // transactionToEdit 값이 없으면 이 블록 실행
                    transaction.append(newTransaction)
                    
                }
                
                
                
                
                // 4. 현재 뷰 닫기
                dismiss()
                
                
            } label:{
                Text(transactionToEdit == nil ? "Create" : "Update")
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
        .onAppear {
            // 뷰가 나타 때, 수정할 데이터가 있는지 확인
            if let transactionToEdit{
                // 데이터가 있다면, UI 상태 변수들을 업데이트
                amount = transactionToEdit.amount
                transactionTitle = transactionToEdit.title
                selectedTransactionType = transactionToEdit.type
                
            }
        }

    }
}

#Preview {
    AddTransactionView(transaction: .constant([])) // 상수 배열 전달
}
