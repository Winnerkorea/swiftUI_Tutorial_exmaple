//
//  ContentView.swift
//  SheetAndNavigation
//
//  Created by Baba on 9/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSheet = false
    @State private var sheetPerson: Person?
    @State private var showPresentaionDetent = false
    @State private var presentFullScreen = false
    @State private var presentViewOnNavigationStack = false
    @State private var navigationPerson: Person?
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Button(action: {
                    showSheet = true
                }, label: {
                    Text("Boolean으로 시트 표시")
                })
                
                Divider()
                
                Button(action: {
                    sheetPerson = Person(name: "홍길동")
                }, label: {
                    Text("Item으로 시트 표시")
                })
                
                Divider()
                
                Button(action: {
                    showPresentaionDetent = true
                }, label: {
                    Text("디덴트로 시트 표시")
                })
                
                Divider()
                
                Button(action: {
                    presentFullScreen = true
                }, label: {
                    Text("Full Screen으로 시트 표시")
                })
                Spacer()
                
                Divider()
                NavigationLink {
                    NavigationView()
                } label: {
                    Text("Navigation Link")
                }
                
                Divider()
                Button(action: {
                    presentViewOnNavigationStack = true
                }, label: {
                    Text("Navigation Desination")
                })
                
                Divider()
                Button("Navigation Destination with Item") {
                    print("Click Navigation Destination With Item")
                    navigationPerson = Person(name: "김철수")
                }
                Divider()
                NavigationLink(value: Person(name: "Bill")) {
                    Text("Navigation Destination with Hashable value")
                }
                
                Spacer()

                
            }
            .padding(.horizontal)
            .padding(.top, 40)
            .sheet(isPresented: $showSheet, content: {
                SheetView(showSheet: $showSheet)
            })
            .sheet(item: $sheetPerson) { person in
                SheetItemView(person: person)
            }
            .sheet(isPresented: $showPresentaionDetent) {
                PresentaionDetentView()
                //                .presentationDetents([.fraction(0.75)]) //  화면 높이의 25%
                //                .presentationDetents([.height(250)]) // 250 포인트 높이
            }
            .fullScreenCover(isPresented: $presentFullScreen) {
                FullScreenView()
            }
            .navigationDestination(isPresented: $presentViewOnNavigationStack) {
                NavigationView()
            }
            .navigationDestination(item: $navigationPerson) { person in
                PersonNavigationView(person: person)
            }
            .navigationDestination(for: Person.self) { person in
                PersonNavigationView(person: person)
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
