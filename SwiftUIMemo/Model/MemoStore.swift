//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by 전수형 on 2021/07/28.
//

//메모 목록을 저장하는 class

import Foundation

//class MemoStore: ObservableObject {
//    @Published var list: [Memo]
//
//
//    init() {
//        list = [
//            Memo(content: "Lorem Ipsum 1"),
//            Memo(content: "Lorem Ipsum"),
//            Memo(content: "Lorem Ipsum")
//        ]
//    }
//
//
//    func insert(memo: String) {
//        list.insert(Memo(content: memo), at: 0)
//    }
//
//    func update(memo: Memo?, content: String){
//        guard let memo = memo else{ return }
//        memo.content = content
//    }
//
//    func delete(memo: Memo) {
//        //콘솔에 나오는 경고문구를 없애기 위해 DispatchQueue.main.async를 사용
//        DispatchQueue.main.async {
//            self.list.removeAll {$0 == memo }
//        }
//    }
//
//    func delete(set: IndexSet) {
//        for index in set {
//            self.list.remove(at: index)
//        }
//    }
//
//}
