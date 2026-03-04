//
//  CategoryRepository.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

protocol CategoryRepository {
    func selectCategory()
}

// MARK: - Default
struct DefaultCategoryRepository: CategoryRepository {
    
    let service: CoreMLService
    
    func selectCategory() {
        service.selectCategory()
    }
    
    
}
