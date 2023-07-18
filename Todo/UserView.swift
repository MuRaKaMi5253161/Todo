//
//  UserView.swift
//  Todo
//
//  Created by 村上太一 on 2023/07/17.
//

import SwiftUI

struct UserView: View {
    
    let image: Image
    let userName: Text
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("こんにちは")
                    .foregroundColor(Color.tTitle)
                    .font(.footnote)
                Text("Taichi Murakami")
                    .foregroundColor(Color.tTitle)
            }
            Spacer() //スペース
            Image("profile")
                .resizable().frame(width: 60, height: 60)
                .clipShape(Circle())
        }
        .padding() //上下左右に余白を開ける
        .background(Color.tBackground)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(image: Image("profile"), userName: Text("Taichi Murakami"))
    }
}
