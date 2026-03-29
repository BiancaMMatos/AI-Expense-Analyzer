//
//  CategoryUseCase.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import UIKit

protocol CategoryUseCaseProtocol {
    func selectCategory(from image: UIImage) async throws -> Any
}


struct CategoryUseCase: CategoryUseCaseProtocol {
    
    let repository: CategoryRepository
    
    init(repository: CategoryRepository) {
        self.repository = repository
    }
    
    func selectCategory(from image: UIImage) async throws -> Any {
        return try await repository.selectCategory(from: image)
    }
}
