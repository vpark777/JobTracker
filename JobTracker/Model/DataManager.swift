//
//  DataManager.swift
//  JobTracker
//
//  Created by Victoria Park on 10/28/21.
//

import Foundation
import CoreData
import UIKit


 class DataManager {
     
     var selector = 0 //for now 0 for all 1 for favorites
     
     static let managedObjectContext: NSManagedObjectContext = {
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         return appDelegate.persistentContainer.viewContext
     }()
     
     // MARK: - Create
     
     static func createJobItem(name: String,role:String,team:String,location:String,link:String, notes: String,status:Int16 = 0,favorite:Bool = false,interviewDate:String = "") -> Job? {
         
         let jobItem = Job(context: managedObjectContext)
 
         jobItem.name = name
         jobItem.role = role
         jobItem.team = team
         jobItem.location = location
         jobItem.link = link
         jobItem.notes = notes
         jobItem.status = status
         jobItem.favorite = favorite
         jobItem.interviewDate = interviewDate
         
         do {
             try managedObjectContext.save()
             return jobItem
         }
         catch {
             
         }
         return nil
     }
     
     // MARK: - Read
     
     static func fetchJobItems(completion: ([Job]?) -> Void) {
         do {
             let jobItems = try managedObjectContext.fetch(Job.fetchRequest())
             completion(jobItems)
         }
         catch {
             
         }
         
         completion(nil)
     }
     static func fetchJobItems2()->[Job]?{
         do {
             print("fetching items from db")
             let jobItems = try managedObjectContext.fetch(Job.fetchRequest())
            return jobItems
         }
         catch {
             
         }
         
         return nil
     }
     static func fetchToDoListItem(name: String, completion: (Job?) -> Void) {
         
         let fetchRequest = NSFetchRequest<Job>(entityName: "Job")
         fetchRequest.predicate = NSPredicate(format: "name == %@", name)
         //add predicate to fetch favorite
         do {
             let jobItem = try managedObjectContext.fetch(fetchRequest)
             completion(jobItem.first)
         }
         catch {
             print("Could not fetch due to error: \(error.localizedDescription)")
         }
         
         completion(nil)
     }
     
     // MARK: - Update
     
     static func updateJob(item: Job, name: String,role:String,team:String,location:String,link:String, notes: String,status:Int16,favorite:Bool = false,interviewDate:String) {
         
         item.name = name
         item.role = role
         item.team = team
         item.location = location
         item.link = link
         item.notes = notes
         item.status = status
         item.favorite = favorite
         item.interviewDate = interviewDate
         
         do {
             try managedObjectContext.save()
         }
         catch {
             print("Could not update an item due to error: \(error.localizedDescription)")
         }
     }
     static func updateFavoriteStatus(item:Job,favorite:Bool = false){
         
         item.favorite = favorite
         
         do {
             try managedObjectContext.save()
         }
         catch {
             print("Could not update an item due to error: \(error.localizedDescription)")
         }
         
     }
     // MARK: - Delete
     
     static func deleteJob(item: Job) {
         managedObjectContext.delete(item)
         
         do {
             try managedObjectContext.save()
         }
         catch {
             
         }
     }
 }

 
