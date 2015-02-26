//
//  TaskModel.swift
//  TaskIt
//
//  Created by Dave Stanton on 2/25/15.
//  Copyright (c) 2015 David Stanton. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
