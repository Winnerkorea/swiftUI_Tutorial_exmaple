//
//  ContentView.swift
//  Income
//
//  Created by Baba on 9/15/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var transactions: [Transaction] = []
    
    @State private var showAddTransactionView: Bool = false
    
    @State private var transactionToEdit: Transaction?
    
    
    
    //MARK: - fileprivate function
    
    fileprivate func floatingButton() -> some View{
        VStack{
            Spacer()
            
            NavigationLink {
                AddTransactionView(transaction: $transactions)
            } label: {
                Text("+")
                    .font(.largeTitle)
                    .padding(.bottom, 7)
                    .frame(width: 70, height: 70)
                    .foregroundStyle(.white)
                    .background(Color("primaryLightGreen"))
                    .clipShape(Circle())
            }
            
        }
    }
    
    
    fileprivate func BalanceView() -> some View {
        ZStack {
            // 뷰 콘텐츠가 여기에 들어갑니다.
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.primaryLightGreen)
            VStack(alignment: .leading) {
                
                HStack {
                    VStack(alignment: .leading){
                        Text("Balance")
                            .font(.caption)
                            .foregroundStyle(Color.white)
                        
                        
                        Text(total)
                            .font(.system(size: 42, weight: .semibold))
                            .foregroundStyle(Color.white)
                    }
                    Spacer()
                }
                .padding(.top)
                
                // 하단 그룹 : 수입과 지출
                // 지출
                HStack(spacing: 25) {
                    VStack(alignment: .leading){
                        Text("Expense")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.white)
                        Text(expenses)
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(.white)
                        
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Income")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.white)
                        // Todo: 실제 총 수입 데이터로 교체해야 한다.
                        Text(income)
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(.white)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(height: 150)
        .padding(.horizontal)
    }
    
    
    //MARK: - Sum Balance , Expenses Add 총 지출을 위한 계산 프로퍼티
    
    private var expenses: String{
        
        let sumExpenses = transactions
            .filter{$0.type == .expense}
            .reduce(0){
                $0 + $1.amount
            }
        
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: sumExpenses as NSNumber) ?? "0.00"
    }
    
    //MARK: - Sum Balance , Income Add 총 수입을 위한 계산 프로퍼티
    
    private var income: String{
        let sumIncome = transactions
            .filter {$0.type == .income}
            .reduce(0){
                $0 + $1.amount
            }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: sumIncome as NSNumber) ?? "0.00"
    }
    
    // MARK: - 총잔액을 위한 계산 프로퍼티
    
    private var total: String{
        
        // 수입 합계 계산
        let sumIncome = transactions
            .filter {$0.type == .income}
            .reduce(0){
                $0 + $1.amount
            }
        
        // 지출 합계 계산
        let sumExpenses = transactions
            .filter{$0.type == .expense}
            .reduce(0){
                $0 + $1.amount
            }
        
        // 총잔액 계산
        var totalValue = sumIncome - sumExpenses
        
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: totalValue as NSNumber) ?? "0.00"
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    BalanceView()
                    List{
                        ForEach(transactions) { transaction in
                            Button {
                            //Button Action
                                transactionToEdit = transaction  // Bool 토글 대신, 항목을 할당
                                
                            } label: {
                                TransactionView(transaction: transaction)
                                    .listRowSeparator(.hidden)
                            }
                            .tint(.black)
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                
                floatingButton()
            }
            .navigationDestination(isPresented: $showAddTransactionView, destination: {
                AddTransactionView(transaction: $transactions)
            })  // 새 항목 추가용
            .navigationDestination(item: $transactionToEdit, destination: { transaction in
                AddTransactionView(transaction: $transactions, transactionToEdit: transaction)
            })
            
            
            
            .navigationTitle("Income")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Todo 설정 액션 버튼
                        print("click GearShape Button")
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
        
        
        
        
    }
}

#Preview {
    HomeView()
}

