//
//  DonationsViewModel.swift
//  App197
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI
import CoreData

final class DonationsViewModel: ObservableObject {
    
    @Published var donations: [DonationsModel] = []
    
    @Published var platforms: [String] = ["Youtube", "Twitch", "Facebook"]
    @Published var current_platform: String = ""
    
    @Published var streamer: String = ""
    @Published var amount: String = ""
    
    @Published var comment: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isChart: Bool = false
    
    func addDonation(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "DonationsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "DonationsModel", into: context) as! DonationsModel
        
        trans.platform = current_platform
        trans.streamer = streamer
        trans.amount = Int16(amount) ?? 0
        trans.comment = comment
        trans.date = Date()
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchDonations() {
        
        CoreDataStack.shared.modelName = "DonationsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DonationsModel>(entityName: "DonationsModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.donations = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.donations = []
        }
    }
}
