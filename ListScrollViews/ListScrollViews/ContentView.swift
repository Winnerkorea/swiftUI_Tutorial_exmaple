//
//  ContentView.swift
//  ListScrollViews
//
//  Created by Winnerkorea on 9/13/25.
//

import SwiftUI

struct ContentView: View {
    @State private var shoppingItems: [ShoppingModel] = [
        ShoppingModel(title: "Apple", price: "$1.00"),
        ShoppingModel(title: "Banana", price: "$0.50"),
        ShoppingModel(title: "Orange", price: "$0.75")
    ]
    
    @State private var toDoItems: [String] = [
        "walk the dog",
        "Wash clothes",
        "Do homework"
    ]
    
    
    var body: some View {
        VStack {
            List(shoppingItems) { shoppingItem in
                HStack{
                    Text(shoppingItem.title)
                    Spacer()
                    Text(shoppingItem.price)
                }
            }
            
            List {
                Text("An Item")
                Image(systemName: "person.fill")
                Button("Click Me") {
                    // Action
                    print("Click Ok")
                }
            }
            List{
                ForEach(shoppingItems) { shoppingItem in
                    HStack{
                        Text(shoppingItem.title)
                        Spacer()
                        Text(shoppingItem.price)
                        
                    }
                }
                Text("Another Item")
                Text("Another Item 2")
                ForEach(toDoItems, id:\.self) { toDoItem in
                    Text(toDoItem)
                }
            }
         
        }
    }
}

#Preview {
    ContentView()
}
