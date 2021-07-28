//
//  ComposeScene.swift
//  SwiftUIMemo
//
//  Created by 전수형 on 2021/07/28.
//

import SwiftUI

struct ComposeScene: View {
    @EnvironmentObject var keyboard: KeyboardObserver
    @EnvironmentObject var store: MemoStore
    @State private var content: String = ""
    
    @Binding var showComposer: Bool
    
    
    var body: some View {
        NavigationView {
            VStack {
                //text를 입력받음
                TextView(text: $content)
                    .frame(maxWidth: .infinity, maxHeight:  .infinity)
//                    .padding(.bottom, keyboard.context.height)
                    .animation(.easeInOut(duration: keyboard.context.animatioinDuration))
//                    .background(Color.yellow)
            }
            //화면 전체로 frame을 선언
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //displayMode를 inline으로 지정하면 largeTitle이였던 타이틀이 변경됨
            .navigationBarTitle("New Memo :)", displayMode: .inline)
            .navigationBarItems(leading: Dismissbutton(show: $showComposer), trailing: SaveButton(show: $showComposer, content: $content))
        }
    }
}
//ComposeScene에서만 사용하는 Button을 만들기 위해 fileprivate으로 선언
fileprivate struct Dismissbutton: View{
    @Binding var show: Bool
    var body: some View{
        Button(action: {
            self.show = false
        }, label: {
            Text("Cancel")
        })
    }
}

fileprivate struct SaveButton: View{
    @Binding var show: Bool
    @EnvironmentObject var store: MemoStore
    @Binding var content: String
    
    var body: some View{
        Button(action: {
            //저장한 내용을 저장
            self.store.insert(memo: self.content)
            
            self.show = false
        }, label: {
            Text("Save")
        })
    }
}

struct ComposeScene_Previews: PreviewProvider {
    static var previews: some View {
        //constant(false)를 전달
        ComposeScene(showComposer: .constant(false))
            .environmentObject(MemoStore())
            .environmentObject(KeyboardObserver())
    }
}
