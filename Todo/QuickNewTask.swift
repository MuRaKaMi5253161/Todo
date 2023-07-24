//
//  QuickNewTask.swift
//  Todo
//
//  Created by 村上太一 on 2023/07/19.
//

import SwiftUI

struct QuickNewTask: View {
    let category: TodoEntity.Category
    @State var newTask: String = ""
    @Environment(\.managedObjectContext) var viewContext
    
    fileprivate func addNewTask() {
        if(self.newTask != "") {
            TodoEntity.create(in: self.viewContext, category: self.category, task: self.newTask)
            self.newTask = ""
        }
    }
    
    fileprivate func cancelTask() {
        self.newTask = ""
    }
    
    var body: some View {
        HStack {
            TextField("新しいタスク", text: $newTask) {
                self.addNewTask()
            }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
            Button(action: {
                self.addNewTask()
            }) {
                Text("追加")
            }
            .foregroundColor(.blue)
            Button(action: {
                self.cancelTask()
            }) {
                Text("キャンセル")
            }
            .foregroundColor(.blue)
        }
    }
}

struct QuickNewTask_Previews: PreviewProvider {
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    static var previews: some View {
        QuickNewTask(category: .ImpUrg_1st)
            .environment(\.managedObjectContext, context)
    }
}
