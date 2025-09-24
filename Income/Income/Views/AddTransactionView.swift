//
//  AddTransactionView.swift
//  Income
//
//

import SwiftUI

struct AddTransactionView: View {
    @State private var amount = 0.0
    @State private var transactionTitle = ""
    @State private var selectedTransactionType: TransactionType = .expense
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    var transactionToEdit: TransactionItem?
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    
    
    @AppStorage("currency") var currency = Currency.usd
    
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = currency.locale
        return numberFormatter
    }
    
    var body: some View {
        VStack {
            TextField("0.00", value: $amount, formatter: numberFormatter)
                .font(.system(size: 60, weight: .thin))
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
            Rectangle()
                .fill(Color(uiColor: UIColor.lightGray))
                .frame(height: 0.5)
                .padding(.horizontal, 30)
            Picker("Choose Type", selection: $selectedTransactionType) {
                ForEach(TransactionType.allCases) { transactionType in
                    Text(transactionType.title)
                        .tag(transactionType)
                }
            }
            TextField("Title", text: $transactionTitle)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 30)
                .padding(.top)
            Button(action: {
                guard transactionTitle.count >= 2 else {
                    alertTitle = "Invalid Title"
                    alertMessage = "Title must be 2 or more characters long."
                    showAlert = true
                    return
                }
                
                if let transactionToEdit = transactionToEdit {
                    transactionToEdit.title = transactionTitle
                    transactionToEdit.amount = amount
                    transactionToEdit.type = Int16(selectedTransactionType.rawValue)
                    
                    do{
                        try viewContext.save()
                        dismiss()
                        
                    } catch {
                        print("업데이트 실패: \(error.localizedDescription)")
                        alertTitle = "저장실패"
                        alertMessage = "데이터를 저장하는 중에 오류가 발생했습니다. 다시 시도해 주세요."
                        showAlert = true
                        return
                    }
                    
                } else {
                    
                    // 새로운 Core Data 방식
                    // 1. Core Data의 TransactionItem 엔티티 인스턴스를 생성합니다.
                    //      이때 반드시 context를 전달해야 합니다.
                    let transaction = TransactionItem(context: viewContext)
                    
                    // 2. 생성된 인스턴스의 각 속성에 값을 할당합니다.
                    transaction.id = UUID()
                    transaction.title = transactionTitle
                    transaction.amount = amount
                    transaction.date = Date()
                    
                    // 'type'은 swift의 TransactionType(enum)을 Core Data의 Int16으로 변환해야 합니다.
                    // 열거형의 rawValue를 사용하여 Int로 변환한 뒤, Int16으로 캐스팅합니다.
                    transaction.type = Int16(selectedTransactionType.rawValue)
                    
                    do {
                        // 저장이 성공하면 뷰를 닫습니다.( dismiss는 이미 외부에 있음)
                        try viewContext.save()
                    } catch {
                        // 저정 중 에러가 발생하면 알림을 표시합니다.
                        // 기존의 알림 로직을 재사용할 수 있습니다.
                        alertTitle = "저장실패"
                        alertMessage = "데이터를 저장하는 중에 오류가 발생했습니다. 다시 시도해 주세요."
                        showAlert = true
                        return
                    }
                    
                }
                
                dismiss()
                
            }, label: {
                Text(transactionToEdit == nil ? "Create" : "Update")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(Color.white)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryLightGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    
            })
            .padding(.top)
            .padding(.horizontal, 30)
            Spacer()
        }
        .onAppear(perform: {
            if let transactionToEdit = transactionToEdit {
                amount = transactionToEdit.amount
                transactionTitle = transactionToEdit.wrappedTitle
                selectedTransactionType = transactionToEdit.wrappedTransactionType
            }
        })
        .padding(.top)
        .alert(alertTitle, isPresented: $showAlert) {
            Button(action: {
                
            }, label: {
                Text("OK")
            })
        } message: {
            Text(alertMessage)
        }

    }
}

#Preview {
    let dataManager = DataManager.sharedPreview
    return AddTransactionView().environment(\.managedObjectContext, dataManager.container.viewContext)
}
