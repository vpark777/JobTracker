//
//  Job+CoreDataProperties.swift
//  JobTracker
//
//  Created by Victoria Park on 10/28/21.
//
//

import Foundation
import CoreData


extension Job {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Job> {
        return NSFetchRequest<Job>(entityName: "Job")
    }

    @NSManaged public var name: String?
    @NSManaged public var role: String?
    @NSManaged public var location: String?
    @NSManaged public var status: Int16
    @NSManaged public var favorite: Bool
    @NSManaged public var team: String?
    @NSManaged public var link:String?
    @NSManaged public var notes: String?
    @NSManaged public var interviewDate:String?

}

extension Job : Identifiable {

}
