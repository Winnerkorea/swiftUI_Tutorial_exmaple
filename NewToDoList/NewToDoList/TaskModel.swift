//
//  TaskModel.swift
//  NewToDoList
//
//  Created by Baba on 9/18/25.
//

import Foundation

struct TaskModel: Identifiable {
    let id = UUID()
    var title : String
    var priority: Priority
    var isComplete: Bool
}

