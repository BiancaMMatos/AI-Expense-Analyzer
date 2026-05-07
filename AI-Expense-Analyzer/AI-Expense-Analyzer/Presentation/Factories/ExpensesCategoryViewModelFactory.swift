//
//  ExpensesCategoryViewModelFactory.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 30/04/26.
//


import CoreData

enum ExpensesCategoryViewModelFactory {
    
    @MainActor
    static func make(context: NSManagedObjectContext) -> ExpensesCategoryViewModel {
        
        let repository = CoreDataExpenseRepository(context: context)
        let fetchUseCase = FetchExpensesByCategoryUseCase(repository: repository)
        
        return ExpensesCategoryViewModel(fetchUseCase: fetchUseCase)
    }
}
