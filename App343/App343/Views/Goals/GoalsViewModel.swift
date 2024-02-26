//
//  GoalsViewModel.swift
//  App343
//
//  Created by DJUNA on 03/02/2024.
//

import SwiftUI
import CoreData

final class GoalsViewModel: ObservableObject {
    
    @AppStorage("goalsAch") var goalsAch: Int = 0
    @AppStorage("Income") var Income: Int = 0
    @AppStorage("Upcome") var Upcome: Int = 0

    @Published var goalName: String = ""
    @Published var goalDescription: String = ""
    @Published var goalMoney: String = ""
    @Published var goalTask: String = ""
    @Published var goalTMoney: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false

    @Published var goals: [GoalModel] = []
    @Published var selectedGoal: GoalModel?
    
    func addGoal(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "GoalModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "GoalModel", into: context) as! GoalModel
        
        sub.goalName = goalName
        sub.goalDescription = goalDescription
        sub.goalMoney = goalMoney
        sub.goalTask = goalTask
        sub.goalTMoney = goalTMoney

        CoreDataStack.shared.saveContext()
        
        completion()

    }
    
    func fetchGoals() {
        
        CoreDataStack.shared.modelName = "GoalModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GoalModel>(entityName: "GoalModel")
        
        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.goals = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.goals = []
        }
    }
}


