//
//  AddExpenseViewModelFactory.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 03/03/26.
//


struct AddExpenseViewModelFactory {
    
    static func makeViewModel() -> AddExpenseViewModel {
        let visionService = VisionService()
        let coreMLService = CoreMLService()
        let coreDataService = CoreDataService()
        
        let categoryRepository = DefaultCategoryRepository(ocrService: visionService, mlService: coreMLService)
        let expenseRepository = ExpenseRepository(service: coreDataService)
        
        let categoryUseCase = CategoryUseCase(repository: categoryRepository)
        let expenseUseCase = DefaultSaveExpenseUseCase(repository: expenseRepository)
        
        let viewModel = AddExpenseViewModel(expenseUseCase: expenseUseCase, categoryUseCase: categoryUseCase)
        
        return viewModel
    }
    
}
