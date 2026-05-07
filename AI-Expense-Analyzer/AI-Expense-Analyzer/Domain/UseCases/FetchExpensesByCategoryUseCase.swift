//
//  FetchExpensesByCategoryUseCase.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 30/04/26.
//

import Foundation


/// Goal: Show cards from category with values.
/// This Use Case is responsible for search all expenses e join them, summarizing the spend of total expense on each category.
protocol FetchExpensesByCategoryUseCaseProtocol {
    
    /// Execution of fetch of Expenses
    /// - Returns: Returns a dict with Category and total value of expense
    func execute() throws -> [Category: Double]
}


struct FetchExpensesByCategoryUseCase: FetchExpensesByCategoryUseCaseProtocol {
    
    private let repository: ExpenseRepositoryProtocol
    
    init(repository: ExpenseRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() throws -> [Category: Double] {
        let allExpenses = try repository.fetchAllExpenses()
        var categoryTotals: [Category: Double] = [:]
        
        for category in Category.allCases {
            categoryTotals[category] = 0.0
        }
        
        for expense in allExpenses {
            categoryTotals[expense.category, default: 0.0] += expense.amount
        }
        
        return categoryTotals
    }
}
