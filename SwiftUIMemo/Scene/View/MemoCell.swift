//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by 전수형 on 2021/07/28.
//

import SwiftUI

//body에 있던 뷰를 분리했음. shift+command+a -> Extract Subview -> 새로운 SwiftUI.swift에 저장
struct MemoCell: View {
    //생성자로 전달받을 list의 memo를 저장할 변수. ObservedObject는 메모객체가 업데이트되는 시점마다 view가 새롭게 그려져 최신데이터를 표시함
    @ObservedObject var memo: Memo
    @EnvironmentObject var formatter: DateFormatter
    
    var body: some View {
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
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        //Previews에서는 "Test"라는 더미데이터를 주어서 오류를 해결
        MemoCell(memo: Memo(content: "Test"))
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
