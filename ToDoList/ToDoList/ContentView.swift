//
//  ContentView.swift
//  ToDoList
//
//  Created by Baba on 9/16/25.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State private var todoLists : [TodoListModel] = [
        TodoListModel(title: "Get The Item", type: .important, createdAt: Date()),
        TodoListModel(title: "New The Item", type: .urgent, createdAt: Date()),
        TodoListModel(title: "Change New Item", type: .normal, createdAt: Date())
        
    ]
    
    @State private var showAddTodoView : Bool = false
    @State private var toDoListToEdit:TodoListModel?
    
    fileprivate func floatingButton() -> some View {
        VStack{
            
            Spacer()
            
            NavigationLink {
                // 목적지 뷰
                AddTodoView(toDolists: $todoLists)
            } label: {
                Text("+")
                    .font(.largeTitle)
                    .padding(.bottom, 8)
                    .frame(width: 70, height: 70)
                    .foregroundStyle(.white)
                    .background(Color("main"))
                    .clipShape(Circle())
            }

        }
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(todoLists) { toDolist in
                            Button {
                                toDoListToEdit = toDolist
                            } label: {
                                TodoListItemView(toDolist: toDolist)
                            }
                        }
                        .scrollContentBackground(.hidden)

                    }
                    .scrollContentBackground(.hidden)

                }
                floatingButton()
            }
            .navigationTitle("Today's Task")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // Setting View
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundStyle(.black)
                    }

                }
            }
            .navigationDestination(isPresented: $showAddTodoView) {
                AddTodoView(toDolists: $todoLists)
            }
            .navigationDestination(item: $toDoListToEdit) { toDoList in
                AddTodoView(toDolists: $todoLists, toDoListToEdit: toDoListToEdit)
            }
        }
        
    }
}

#Preview {
    ContentView()
}


