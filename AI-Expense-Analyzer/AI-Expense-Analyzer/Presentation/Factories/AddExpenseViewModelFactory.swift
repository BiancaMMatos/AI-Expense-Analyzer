//
//  AddExpenseViewModelFactory.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 03/03/26.
//


import CoreData

enum AddExpenseViewModelFactory {
    
    @MainActor
    static func make(context: NSManagedObjectContext) -> AddExpenseViewModel {
        
        // 1. Instance of all Services and Repositories (Data Layer)
        let ocrService = VisionOCRService()
        let mlService = CoreMLCategoryClassifier()
        let repository = CoreDataExpenseRepository(context: context)
        
        // 2. Instance of Use Cases by injecting Services on them (Domain Layer)
        let analyzeUseCase = AnalyzeReceiptUseCase(ocrService: ocrService, mlService: mlService)
        let saveUseCase = SaveExpenseUseCase(repository: repository)
        
        // 3. Returns ViewModel
        return AddExpenseViewModel(
            analyzeReceiptUseCase: analyzeUseCase,
            saveExpenseUseCase: saveUseCase
        )
    }
}
