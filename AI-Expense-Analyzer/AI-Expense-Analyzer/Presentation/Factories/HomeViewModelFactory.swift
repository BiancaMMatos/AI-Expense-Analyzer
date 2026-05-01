//
//  HomeViewModelFactory.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 30/04/26.
//

import CoreData

enum HomeViewModelFactory {
    
    // @MainActor garantees that ViewModel will be created on main thread
    @MainActor
    static func make(context: NSManagedObjectContext) -> HomeViewModel {
        
        // 1. Instance of Infrastructure (Data Layer)
        let repository = CoreDataExpenseRepository(context: context)
        
        // 2. Instance of Business Logic (Domain Layer)
        let generateInsightUseCase = GenerateInsightUseCase(repository: repository)
        
        // 3. Returns presentation ready (Presentation Layer)
        return HomeViewModel(generateInsightUseCase: generateInsightUseCase)
    }
}
