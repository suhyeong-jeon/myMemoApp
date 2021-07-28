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
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                VStack(alignment: .leading) {
                    Text(memo.content)
                        .font(.body)
                        //lineLimit를 1로 하면 1줄이 넘어갈시 뒷부분을 생략함
                        .lineLimit(1)
                    
                    Text("\(memo.insertDate, formatter: self.formatter)")
                        //caption으로 날짜부분의 text 스타일을 바꿔줌
                        .font(.caption)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                    
                }
            }
            .navigationBarTitle("My Memo :)")
        }
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
