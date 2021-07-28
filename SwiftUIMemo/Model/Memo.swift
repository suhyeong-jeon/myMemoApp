//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by 전수형 on 2021/07/28.
//

import SwiftUI

//ObservableObject는 반응형 UI를 만들기위해 필요함
//Identifiable은 데이터 목록을 테이블뷰에 쉽게 바인딩 할수 있음
class Memo: Identifiable, ObservableObject {
    let id: UUID
    //published는 새로운 값이 저장될때마다 바인딩되어있는 값이 자동으로 저장됨
    @Published var content: String
    let insertDate: Date
    
    init(id: UUID = UUID(), content: String, insertDate: Date = Date()){
        self.id = id
        self.content = content
        self.insertDate = insertDate
    }
}

extension Memo: Equatable {
    static func == (lhs: Memo, rhs: Memo) -> Bool {
        return lhs.id == rhs.id
    }
}
