//
//  Extension+UIDevice.swift
//  ToDoList
//
//  Created by Baba on 9/18/25.
//

import SwiftUI

extension UIDevice {
    
    //이 기기가 iPad인지 확인하는 정적 연산 프로퍼티
    static var isPad: Bool {
        // 현재 기기의 사용자 인터페이스Idiom(Interface Idiom) .pad와 같은지 비교합니다.
        UIDevice.current.userInterfaceIdiom == .pad
    }
    //이 기기가 iPhone인지 확인하는 정적 연산 프로퍼터
    static var isPhone: Bool {
        // 현재 기기의 사용자 인터페이스Idiom(Interface Idom) .phone과 같은지 비교합니다.
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
    
}
