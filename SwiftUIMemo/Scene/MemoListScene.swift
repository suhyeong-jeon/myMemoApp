//
//  ContentView.swift
//  SwiftUIMemo
//
//  Created by 전수형 on 2021/07/28.
//

import SwiftUI

struct MemoListScene: View {
    //EnvironmentObject는 SceneDelegate에서 store를 선언해줬기 떄문
    //이렇게 되면 하나의 데이터를 여러 뷰에서 공유함
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var formatter: DateFormatter
    
    @State var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                //memo를 MemoCell로 전달
                MemoCell(memo: memo)
            }
            .navigationBarTitle("My Memo :)")
            //🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
            //여기서 전달한 showComposer는 ModalButton의 show에 저장됨
            //View 외부에 있는 속성을 바꾸고싶다면 binding속성으로 전달해야함
            .navigationBarItems(trailing: ModalButton(show: $showComposer))
            //sheet에서는 showComposer가 true면 ComposeScene()을 실행하고 return된 화면을 modal방식으로 실행함
            //ComposeScene에서 binding으로 showComposer가 false가 되면 = cancel, save를 누르면 sheet가 내려감
            .sheet(isPresented: $showComposer, content: {
                ComposeScene(showComposer: self.$showComposer)
                    //environmentObject(self.store)를 등록하여 store 변수를 미리 메모리에 할당시킴
                    .environmentObject(self.store)
            })
        }
    }
}

fileprivate struct ModalButton: View{
    @Binding var show: Bool
    
    
    var body: some View{
        Button(action:  {
            //만약 여기서 show를 바꾸면 showComposer 속성도 바뀌게됨
            self.show = true
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}

