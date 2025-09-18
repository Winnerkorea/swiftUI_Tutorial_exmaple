//
//  Priority.swift
//  NewToDoList
//
//  Created by Baba on 9/18/25.
//

import Foundation
import SwiftUI

enum Priority: String, CaseIterable, Identifiable {
    case urgent = "Urgent"
    case normal = "Normal"
    case optional = "Optional"

    // Picker에서 사용하기 위해 Identifiable 채택
    var id: String { self.rawValue }

    // 연산 프로퍼티: 각 케이스에 맞는 텍스트 반환
    var title: String {
        switch self {
        case .urgent:
            return "Urgent"
        case .normal:
            return "Normal"
        case .optional:
            return "Optional"
        }
    }

    // 연산 프로퍼티: 각 케이스에 맞는 색상 반환
    var color: Color {
        switch self {
        case .urgent:
            return .red
        case .normal:
            return .blue
        case .optional:
            return .green
        }
    }
}

