//
//  ComposeScene.swift
//  SwiftUIMemo
//
//  Created by 전수형 on 2021/07/28.
//

import SwiftUI

struct ComposeScene: View {
    @EnvironmentObject var store: MemoStore
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //text를 입력받음
                TextField("", text: $content)
            }
            //화면 전체로 frame을 선언
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //displayMode를 inline으로 지정하면 largeTitle이였던 타이틀이 변경됨
            .navigationBarTitle("New Memo :)", displayMode: .inline)
            .navigationBarItems(leading: Dismissbutton(), trailing: SaveButton())
        }
    }
}
//ComposeScene에서만 사용하는 Button을 만들기 위해 fileprivate으로 선언
fileprivate struct Dismissbutton: View{
    var body: some View{
        Button(action: {
            
        }, label: {
            Text("Cancel")
        })
    }
}

fileprivate struct SaveButton: View{
    var body: some View{
        Button(action: {
            
        }, label: {
            Text("Save")
        })
    }
}

struct ComposeScene_Previews: PreviewProvider {
    static var previews: some View {
        ComposeScene()
            .environmentObject(MemoStore())
    }
}
