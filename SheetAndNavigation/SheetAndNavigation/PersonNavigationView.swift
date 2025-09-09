//
//  PersonNavigationView.swift
//  SheetAndNavigation
//
//  Created by Baba on 9/9/25.
//

import SwiftUI

struct PersonNavigationView: View {
    let person: Person          // 데이터를 받기 위한 프로퍼티
    var body: some View {
        Text("전달받은 사람의 이름은 \(person.name) 입니다.")
    }
}

#Preview {
    PersonNavigationView(person: Person(name: "홍길동"))
}
