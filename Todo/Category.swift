//
//  Category.swift
//  Todo
//
//  Created by 村上太一 on 2023/07/13.
//

import SwiftUI

struct Category: View {
    var body: some View {
        Image(systemName: "person")
            .resizable() //サイズ変更
            .scaledToFit() //画像の比率を指定
            .foregroundColor(.white) //画像の色を指定
            .padding(2.0) //画像に余白が追加される
            .frame(width: 30,height: 30) // 画像のサイズ
            .background(.black) //背景色を表示
            .cornerRadius(6) //画像の角を削る
            // モディファイヤの指定前後で結果が変わる
           
        
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        Category()
    }
}
