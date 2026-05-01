//
//  SaveExpenseUseCase.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 29/04/26.
//

import Foundation

/// Goal: Register expense
protocol SaveExpenseUseCaseProtocol {
    func execute(amount: Double, category: Category) throws
}

struct SaveExpenseUseCase: SaveExpenseUseCaseProtocol {
    
    private let repository: ExpenseRepositoryProtocol
    
    init(repository: ExpenseRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(amount: Double, category: Category) throws {
        
        // Business Logic: Not allowing expenses with zero or negative amount
        guard amount > 0 else {
            throw NSError(domain: "InvalidAmount", code: 0, userInfo: [NSLocalizedDescriptionKey: "The expense value should be greater than zero."])
        }
        
        // Create entity
        let expense = Expense(id: UUID(),
                              amount: amount,
                              category: category,
                              date: Date()
        )
        
        // Let repository save (it will convert to CoreDate inside)
        try repository.save(expense: expense)
        
    }
    
    
}
