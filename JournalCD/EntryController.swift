//
//  EntryController.swift
//  JournalCD
//
//  Created by Brady Bentley on 12/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    // MARK: - Properties
    
    //shared Instance AKA Singleton
    static let shared = EntryController()
    private init (){}
    
    // MARK: - CRUD Functions
    func addEntryWith(title: String, body: String){
        Entry(title: title, body: body)
        saveToPersistentStore()
    }
    
    func update(entry: Entry, newTitle: String, newBody: String){
        entry.title = newTitle
        entry.body = newBody
        saveToPersistentStore()
    }
    
    func delete(entry: Entry){
        //asks parent what sand box it is living in and delete it from there
        entry.managedObjectContext?.delete(entry)
        saveToPersistentStore()
    }
    
    // MARK: - PERSISTENCE
    
    func saveToPersistentStore(){
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error in \(#function) : \(error.localizedDescription)")
        }
    }
}
