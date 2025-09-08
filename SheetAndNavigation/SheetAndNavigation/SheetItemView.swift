//
//  SheetItemView.swift
//  SheetAndNavigation
//
//  Created by Baba on 9/8/25.
//

import SwiftUI

struct SheetItemView: View {
    let person: Person // Person 객체를 받음

    var body: some View {
        Text("선택된 사람의 이름은 \(person.name) 입니다.")
    }
}

#Preview {
    SheetItemView(person: Person(name: "홍길동"))
}
