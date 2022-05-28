//
//  ToDoListItem+CoreDataProperties.swift
//  yetAnotherTODO
//
//  Created by a-robot on 4/25/22.
//
//

import Foundation
import CoreData


extension ToDoListItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItems> {
        return NSFetchRequest<ToDoListItems>(entityName: "ToDoListItems")
    }

	// [data context-manager]
    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

extension ToDoListItems : Identifiable {

}
