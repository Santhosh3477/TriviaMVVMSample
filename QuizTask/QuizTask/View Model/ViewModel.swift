//
//  ViewModel.swift
//  QuizTask
//
//  Created by Santhosh on 01/10/20.
//  Copyright © 2020 Contus. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DetailsViewModel {
    
    // CoreData managedObject context
    let context : NSManagedObjectContext!
    
    init (){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
}

// MARK: Methods to save and fetch from Local Database using Coredata
extension DetailsViewModel {
    
    // Method to save user details in Database
    func saveDetails(name : String!, answer1: String!, answer2: String!) {
        let entity = ParticipantRecords(context : self.context)
        
        // Getting the current date in expected date format
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.dateFormat = "dd MMMM h:mm a"
        let dateStr = dateFormatter.string(from: date)
        
        entity.name = name
        entity.answer1 = answer1
        entity.answer2 = answer2
        entity.submitTime = dateStr
        do{
            // Coredata save mechanism
            try  context.save()
        }catch{
            print("Error : %@", error.localizedDescription)
        }
    }
    
    // Method to fetch user details from Database
    func fetchDataFromDB() -> [ParticipantRecords] {
        do {
            // Coredata fetch mechanism
            let fetch = try self.context.fetch(ParticipantRecords.fetchRequest())
            for data in fetch {
                print((data as! ParticipantRecords).name!)
            }
            return fetch as! [ParticipantRecords]

        }catch{
            print("Error : %@", error.localizedDescription)
        }
        return []
    }

}
