//
//  ContentView.swift
//  Income
//
//  Created by Baba on 9/15/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var transactions: [Transaction] = [
        Transaction(title: "Apple", type: .expense, amount: 5.00, date: Date()),
        Transaction(title: "Apple", type: .expense, amount: 5.00, date: Date())
    ]
    
    fileprivate func floatingButton() -> some View{
        VStack{
            Spacer()
            
            NavigationLink {
                AddTransactionView()
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
                    VStack{
                        Text("Balance")
                            .font(.caption)
                            .foregroundStyle(Color.white)
                        
                        
                        Text("$2")
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
                        Text("$22.00")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(.white)
                        
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Income")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.white)
                        // Todo: 실제 총 수입 데이터로 교체해야 한다.
                        Text("$24.00")
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
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    BalanceView()
                    List{
                        ForEach(transactions) { transaction in
                            TransactionView(transaction: transaction)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                
                floatingButton()
            }
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

