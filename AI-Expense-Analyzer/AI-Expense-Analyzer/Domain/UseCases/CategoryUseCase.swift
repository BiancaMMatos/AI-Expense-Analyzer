//
//  CategoryUseCase.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import Foundation

protocol CategoryUseCaseProtocol {
    func selectCategory()
}


struct CategoryUseCase: CategoryUseCaseProtocol {
    
    let repository: CategoryRepository
    
    init(repository: CategoryRepository) {
        self.repository = repository
    }
    
    func selectCategory() {
        repository.selectCategory()
    }
}
