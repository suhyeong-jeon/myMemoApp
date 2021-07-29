//
//  DetailScene.swift
//  SwiftUIMemo
//
//  Created by 전수형 on 2021/07/29.
//

import SwiftUI

struct DetailScene: View {
    //ObservedObject로 선언되면 Memo에 Published로 선언된 속성이 뷰를 자동으로 업데이트함.
    @ObservedObject var memo: Memo
    @EnvironmentObject var store: MemoStore
    
    @EnvironmentObject var formatter: DateFormatter
    
    @State private var showEditSheet = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(self.memo.content)
                            .padding()
                        
                        Spacer()
                    }
                    
                    Text("\(self.memo.insertDate, formatter: formatter)")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
            }
            
            HStack {
                Button(action: {
                    self.showEditSheet.toggle()
                }, label: {
                    Image(systemName: "square.and.pencil")
                })
                .padding()
                .sheet(isPresented: $showEditSheet, content: {
                    ComposeScene(showComposer: self.$showEditSheet, memo: memo)
                        .environmentObject(self.store)
                        .environmentObject(KeyboardObserver())
                })
            }
        }
        .navigationBarTitle("Look at my Memo")
    }
}

struct DetailScene_Previews: PreviewProvider {
    static var previews: some View {
        DetailScene(memo: Memo(content: "Swift"))
            .environmentObject(DateFormatter.memoDateFormatter)
            .environmentObject(MemoStore())
    }
}
