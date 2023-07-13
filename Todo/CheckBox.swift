//
//  CheckBox.swift
//  Todo
//
//  Created by 村上太一 on 2023/07/13.
//

import SwiftUI

struct CheckBox: View {
    // 変数を別ビューに渡す場合は変数に@stateを指定する
    // @State var checked: Bool = false
    // 変数を他のビューから値を受け取れるようにするには@Bindingを指定する
    @Binding var checked: Bool
    var body: some View {
        // Toggleは別ビュー
//        Toggle(isOn: $checked) {
//            Text("チェックボックス")
//        }
        Image(systemName: checked ? "checkmark.circle":"circle")
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

// キャンバスでのプレビューテスト用のコード
// プログラムの実行には関係ない
struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CheckBox(checked: .constant(false))
            CheckBox(checked: .constant(true))
        }
    }
}
