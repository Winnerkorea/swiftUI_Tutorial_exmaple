//
//  TodoModel.swift
//  ToDoList
//
//  Created by Baba on 9/17/25.
//

import Foundation

// To Do List Model을 만들기 - 어떤 데이터 모델이 있는지 작성.
struct TodoListModel: Identifiable, Hashable{
    let id = UUID()
    let title: String
    let type: ToDoListOptionType
    let createdAt: Date
    
    var displayDate : String{
        // 데이터 로직을 변경해야 되는 Formatter 로직이 들어가야 한다.
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: createdAt)
    }
    
}



