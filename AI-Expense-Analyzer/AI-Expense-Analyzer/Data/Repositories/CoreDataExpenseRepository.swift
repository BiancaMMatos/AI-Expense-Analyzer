//
//  CoreDataExpenseRepository.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import CoreData
import Foundation

/// Assigns protocol from Domain
struct CoreDataExpenseRepository: ExpenseRepositoryProtocol {
    
    private let context: NSManagedObjectContext
    
    /// It's injected to later on be testable
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save(expense: Expense) throws {
        /// 1. Create entity of CoreData
        let newExpenseEntity = ExpenseEntity(context: context)
    
        /// 2. Make mapping (Passing data from Struct to CoreData)
        newExpenseEntity.id = expense.id
        newExpenseEntity.amount = expense.amount
        newExpenseEntity.date = expense.date
        newExpenseEntity.categoryString = expense.category.rawValue
        
        /// 3. Try saving on DataBase
        do {
            try context.save()
            
        } catch {
            throw error
        }
        
    }
    
    func fetchAllExpenses() throws -> [Expense] {
        let request: NSFetchRequest<ExpenseEntity> = ExpenseEntity.fetchRequest()
        
        do {
            /// 1. Search for raw data from CoreData
            let coreDataEntities = try context.fetch(request)
            
            /// 2. Reversed mapping (Passing data from CoreData to Struct)
            let domainExpenses = coreDataEntities.compactMap { entity -> Expense? in
                
                /// Unpack data e recreate Enum Category
                guard let id = entity.id,
                      let date = entity.date,
                      let categoryStr = entity.categoryString,
                      let category = Category(rawValue: categoryStr) else {
                    return nil /// if some data is corrupted then the item shoud be ignored
                }
                
                /// 3. Returns Struct
                return Expense(id: id, amount: entity.amount, category: category, date: date)
            }
            return domainExpenses
            
        } catch {
            throw error
        }
        
    }
    
    func delete(expense: Expense) throws {
        let request: NSFetchRequest<ExpenseEntity> = ExpenseEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", expense.id as CVarArg)
        
        do {
            let results = try context.fetch(request)
            if let entityToDelete = results.first {
                context.delete(entityToDelete)
                try context.save()
            }
        } catch {
            throw error
        }
    }
    
    
    

}
