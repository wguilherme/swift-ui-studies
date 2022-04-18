//
//  ContentView.swift
//  todo
//
//  Created by Withney Guilherme on 18/04/22.
//


import SwiftUI

struct ContentView: View {
    
    @State private var newTodo = ""
    @State private var allTodos: [TodoItem] = []
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Add todo...", text: $newTodo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        guard !self.newTodo.isEmpty else {return}
                        self.allTodos.append(TodoItem(todo: self.newTodo))
                        self.newTodo = ""
                        
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding(.leading, 5)
                    
                }.padding()
                List {
                    ForEach(allTodos){todoItem in
                        Text(todoItem.todo)
                    }
                }
            }.navigationBarTitle("Todos")
        }
    }
}

struct TodoItem: Identifiable {
    let id = UUID()
    let todo: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
