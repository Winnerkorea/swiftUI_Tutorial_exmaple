//
//  ToDoListOptionModel.swift
//  ToDoList
//
//  Created by Baba on 9/17/25.
//

import Foundation

// enum을 이용해서  Option Type을 정의 한다.

enum ToDoListOptionType: CaseIterable, Identifiable{ // CaseIterable 체택
    case urgent
    case important
    case normal
    
    var id: Self{
        self
    }
    
    var optionTitle: String{
        switch self{
        case .urgent:
            return "Urgent"
        case .important:
            return "Important"
        case .normal:
            return "Normal"

        }
    }

}



