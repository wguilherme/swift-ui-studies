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
    private let todosKey = "todosKey"
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Adicionar tarefa...", text: $newTodo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        guard !self.newTodo.isEmpty else {return}
                        self.allTodos.append(TodoItem(todo: self.newTodo))
                        self.newTodo = ""
                        self.saveTodos()
                        
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
            }.navigationBarTitle("Tarefas")
        }
    }
    private func saveTodos(){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(self.allTodos), forKey: todosKey)
    }
}

struct TodoItem: Codable, Identifiable {
    var id = UUID()
    let todo: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
