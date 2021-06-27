//
//  Item+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by ganesh padole on 27/06/21.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var title: String?
    @NSManaged public var done: Bool

}

extension Item : Identifiable {

}
