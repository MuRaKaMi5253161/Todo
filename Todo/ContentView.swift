//
//  ContentView.swift
//  Todo
//
//  Created by 村上太一 on 2023/07/13.
//

import SwiftUI

struct ContentView: View {
    // 村上追記
    static let container = PersistenceController.shared.container
    let context = container.viewContext
    
    var body: some View {
        VStack(spacing: 0) {
            Color.tBackground
                .edgesIgnoringSafeArea(.top)
                .frame(height: 0)
            UserView(image: Image("profile"), userName: Text("Taichi Murakami"))
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    CategoryView(category: .ImpUrg_1st)
                    Spacer()
                    CategoryView(category: .ImpNUrg_2nd)
                }
                Spacer()
                HStack(spacing: 0) {
                    CategoryView(category: .NImpUrg_3rd)
                    Spacer()
                    CategoryView(category: .NImpNUrg_4th)
                }
            }.padding()
            // 村上追記
            .environment(\.managedObjectContext, context)
            
            TaskToday()
                .padding()
        }.background(Color.tBackground)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
