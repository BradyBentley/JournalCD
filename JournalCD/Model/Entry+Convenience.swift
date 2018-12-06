//
//  Entry+Convenience.swift
//  JournalCD
//
//  Created by Brady Bentley on 12/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    
    @discardableResult
    convenience init(title: String, body: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.title = title
        self.body = body
        self.timeStamp = timestamp
    }
    
}
