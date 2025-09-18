//
//  TodoView.swift
//  ToDoList
//
//  Created by Baba on 9/17/25.
//

import SwiftUI

struct AddTodoView: View {
    
    
    // Add Title TextField
    
    @State private var addToDoTitle: String = ""
    @State private var selectedOptionType : ToDoListOptionType = .important
    @State private var showAlert : Bool = false
    @State private var alertTitle : String = ""
    @State private var alertMessage : String = ""
    
    @Binding var toDolists : [TodoListModel]
    
    @Environment(\.dismiss) var dismiss
    
    var toDoListToEdit: TodoListModel?
    
    var body: some View {
        VStack{
            
            // Title
            // TextField을 이용해서 값을 입력한다.
            
            VStack(alignment: .leading) {
                Text("To Do List Title")
                TextField("Add To Do Title", text: $addToDoTitle)
                    .font(.system(size: 15))
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal, 30)
            
            HStack{
                Text("To Do List Type")
                
                Spacer()
                
                Picker(selection: $selectedOptionType) {
                    //옵션 콘텐츠가 여기에 들어갑니다.
                    ForEach(ToDoListOptionType.allCases) { toDolistOptionType in
                        // 각 케이스를 어떻게 표시할지 여기에 작성
                        Text(toDolistOptionType.optionTitle)
                            .tag(toDolistOptionType)
                    }
                } label: {
                    Text("Choose Status")
                }
            }
            .padding(.horizontal, 30)
            
            Button {
                // Action Button
                guard addToDoTitle.count > 2 else {
                    alertTitle = "Invalid Title"
                    alertMessage = "Title must be two or more characters."
                    showAlert = true
                    return
                }
                
                let newToDoList = TodoListModel(title: addToDoTitle, type: selectedOptionType, createdAt: Date())
                
                if let toDoListToEdit {
                    // 수정 로직
                    guard let index = toDolists.firstIndex(of: toDoListToEdit) else {
                        alertTitle = "something wnet wrong"
                        alertMessage = "Cannot update this transaction right now."
                        showAlert = true
                        return
                    }
                    toDolists[index] = newToDoList
                } else {
                    toDolists.append(newToDoList)

                }
                dismiss()
                
                
            } label: {
                Text(toDoListToEdit == nil ? "Create" : "Update")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color("main"))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                
            }
            .padding(.horizontal, 30)

            
            Spacer()
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel){
                //
            }
        } message: {
            Text(alertMessage)
        }
        .onAppear {
            if let toDoListToEdit{
                addToDoTitle = toDoListToEdit.title
                selectedOptionType = toDoListToEdit.type
            }
        }

    }
}

#Preview {
    AddTodoView(toDolists: .constant([]))
}
