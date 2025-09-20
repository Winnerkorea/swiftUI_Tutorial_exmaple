//
//  AddTaskView.swift
//  ToDoList
//
//

import SwiftUI

struct AddTaskView: View {
    
    @State var title = ""
    @State var priority: Priority = .normal
    @State var showInvalidTitleError = false
    @Binding var tasks: [Task]
    @Environment(\.dismiss) var dismiss
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
#if os(iOS)
    fileprivate var iOSLayout: some View{
        // 여기에 iOS 레이아웃 코드를 넣을 것입니다.
        VStack(alignment: .leading) {
            if horizontalSizeClass == .regular && verticalSizeClass == .compact || horizontalSizeClass == .compact && verticalSizeClass == .compact {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.black)
                    }
                }
                .padding(.top)
            }
            if UIDevice.isIPad {
                Spacer()
            }
            Text("Task Title")
                .if(UIDevice.isIPad, transform: { view in
                    view.font(.system(size: 20, weight: .semibold))
                })
                .if(UIDevice.isIPhone, transform: { view in
                    view.font(.system(size: 15, weight: .semibold))
                })
                .padding(.top, 30)
            TextField("Task Title", text: $title)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            
            Text("Priority")
                .font(.system(size: 15, weight: .semibold))
            Picker("Priority", selection: $priority) {
                ForEach(Priority.allCases) { priorityType in
                    Text(priorityType.title)
                        .tag(priorityType)
                }
            }
            .padding(.bottom)
            
            Button(action: {
                guard title.count > 2 else {
                    showInvalidTitleError = true
                    return
                }
                let newTask = Task(title: title, priority: priority, isComplete: false)
                tasks.append(newTask)
                dismiss()
            }, label: {
                Text("Add Task")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(Color.white)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            Spacer()
        }
        .padding(.horizontal)
        .alert("Invalid Title", isPresented: $showInvalidTitleError, actions: {
            Button(action: {}, label: {
                Text("OK")
            })
        }, message: {
            Text("Title must be greater than 2 characters")
        })
    }
#endif
    
#if os(macOS)
    
    fileprivate var macLayout: some View {
        // 여기에 macOS 레이아웃 코드를 넣을 것입니다.
        VStack(alignment: .leading) {
            if horizontalSizeClass == .regular && verticalSizeClass == .compact || horizontalSizeClass == .compact && verticalSizeClass == .compact {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.black)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.top)
            }
            Text("Task Title")
                .font(.system(size: 15, weight: .semibold))
                .padding(.top, 30)
            TextField("Task Title", text: $title)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            
            Text("Priority")
                .font(.system(size: 15, weight: .semibold))
            Picker("Priority", selection: $priority) {
                ForEach(Priority.allCases) { priorityType in
                    Text(priorityType.title)
                        .tag(priorityType)
                }
            }
            .padding(.bottom)
            
            Button(action: {
                guard title.count > 2 else {
                    showInvalidTitleError = true
                    return
                }
                let newTask = Task(title: title, priority: priority, isComplete: false)
                tasks.append(newTask)
                dismiss()
            }, label: {
                Text("Add Task")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(Color.white)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            Spacer()
        }
        .padding(.horizontal)
        .frame(width: 350)
        .alert("Invalid Title", isPresented: $showInvalidTitleError, actions: {
            Button(action: {}, label: {
                Text("OK")
            })
        }, message: {
            Text("Title must be greater than 2 characters")
        })
    }
    
#endif
    
    
    var body: some View {
#if os(iOS)
        iOSLayout
#elseif os(macOS)
        macLayout
#endif
    }
}

#Preview {
    AddTaskView(tasks: .constant([]))
}
