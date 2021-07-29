//
//  CoreDataManager.swift
//  SwiftUIMemo
//
//  Created by 전수형 on 2021/07/29.
//

import CoreData
import SwiftUI

class CoreDataManager: ObservableObject {
    static let shared = CoreDataManager()
    private init() {}
    
    //새로운 매모를 DB에 추가해주는 코드
    func addMemo(content: String) {
        let newMemo = MemoEntity(context: Self.mainContext)
        
        newMemo.id = UUID()
        newMemo.content = content
        newMemo.insertDate = Date()
        
        saveContext()
    }
    
    
    func update(memo: MemoEntity?, content: String) {
        memo?.content = content
        saveContext()
    }
    
    func delete(memo: MemoEntity?) {
        if let memo = memo {
            Self.mainContext.delete(memo)
            saveContext()
        }
    }
    
    
    
    //AppDelegate.swift로 이동해서 36줄부터 79줄까지 주석처리를 해주고 붙여넣기를 해준 후 lazy -> static
    
    // MARK: - Core Data stack
    
    static var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SwiftUIMemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = Self.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
