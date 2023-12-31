//
//  TodoDetailRow.swift
//  Todo
//
//  Created by 村上太一 on 2023/07/20.
//

import SwiftUI

struct TodoDetailRow: View {
    // DBのエンティティを受け取りUIに反映する場合に利用
    @ObservedObject var todo: TodoEntity
    var hideIcon = false
    var body: some View {
        HStack {
            if !hideIcon {
                Category(TodoEntity.Category(rawValue:todo.category))
            }
            CheckBox(checked: Binding(get: {
                self.todo.state == TodoEntity.State.done.rawValue
            }, set:  {
                self.todo.state = $0 ? TodoEntity.State.done.rawValue : TodoEntity.State.todo.rawValue
            })) {
                if self.todo.state == TodoEntity.State.done.rawValue {
                    Text(self.todo.task ?? "no Title").strikethrough()
                } else {
                    Text(self.todo.task ?? "no Title")
                }
                
            }.foregroundColor(self.todo.state == TodoEntity.State.done.rawValue ? .secondary : .primary)
        }.gesture(DragGesture().onChanged({ value in
            if value.predictedEndTranslation.width > 200 {
                if self.todo.state != TodoEntity.State.done.rawValue {
                    self.todo.state = TodoEntity.State.done.rawValue
                }
            } else if value.predictedEndTranslation.width < -200 {
                if self.todo.state != TodoEntity.State.todo.rawValue {
                    self.todo.state = TodoEntity.State.todo.rawValue
                }
            }
        }))
    }
}

struct TodoDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        let container = PersistenceController.shared.container
        let context = container.viewContext
        
        let newTodo = TodoEntity(context: context)
        newTodo.task = "将来への人間関係づくり"
        newTodo.state = TodoEntity.State.done.rawValue
        newTodo.category = 0
        let newTodo1 = TodoEntity(context: context)
        newTodo1.task="クレームへの対応"
        newTodo.category = 1
        let newTodo2 = TodoEntity(context: context)
        newTodo2.task="無意味な接待や付き合い"
        newTodo2.category = 2
        let newTodo3 = TodoEntity(context: context)
        newTodo3.task="長時間、必要以上の息抜き"
        newTodo3.category = 3
        return VStack(alignment: .leading) {
            VStack {
                TodoDetailRow(todo: newTodo)
                TodoDetailRow(todo: newTodo, hideIcon: true)
                TodoDetailRow(todo: newTodo1)
                TodoDetailRow(todo: newTodo2)
                TodoDetailRow(todo: newTodo3)
            }.environment(\.managedObjectContext, context)
        }
    }
}
