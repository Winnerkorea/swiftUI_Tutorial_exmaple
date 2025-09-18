//
//  TodoListItemView.swift
//  ToDoList
//
//  Created by Baba on 9/17/25.
//

import SwiftUI

struct TodoListItemView: View {
    
    let toDolist : TodoListModel
    
    var body: some View {
        
        VStack {
            
            Rectangle()
                .frame(maxWidth:.infinity)
                .frame(height: 0.5)
                .foregroundColor(Color.gray.opacity(0.8))
                .cornerRadius(4)
           
            
            HStack{
                HStack{
                    Image(systemName: "text.page")
                        .font(.system(size: 24))
                        .foregroundStyle(.white)
                        .frame(width: 40, height: 40)
                        .background(Color("main"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    VStack(alignment: .leading) {
                        Text(toDolist.title)
                        Text(toDolist.displayDate)
                    }
                    
                }
                Spacer()
                // Type 에 따른 함수 설정 하기
                // 만약 타입 1번이면, A을 표시한다. 만약 타입 2번이면, B을 표시한다. 만약 타입 3번이면 C를 표시한다.
                // if 구문으로 구성하고 추후에 switch문으로 변경해서 refactory 한다.
                if toDolist.type == .important {
                    Text("important")
                        .padding(.horizontal)
                        .padding(.vertical,4)
                        .background(Color.blue)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else if toDolist.type == .urgent{
                    Text("urgent")
                        .padding(.horizontal)
                        .padding(.vertical,4)
                        .background(Color.red)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Text("Normal")
                        .padding(.horizontal)
                        .padding(.vertical,4)
                        .background(Color.green)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                                
            }
            .padding(.vertical, 8)
        }
        .listRowSeparator(.hidden)
    }
}

#Preview {
    TodoListItemView(toDolist: .init(title: "Apple", type: .normal, createdAt: Date()))
}
