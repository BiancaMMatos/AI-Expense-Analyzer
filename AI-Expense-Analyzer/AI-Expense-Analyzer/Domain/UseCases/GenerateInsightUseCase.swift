//
//  GenerateInsightUseCase.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import Foundation

protocol GenerateInsightUseCaseProtocol {
    func execute() throws -> Insight
}

struct GenerateInsightUseCase: GenerateInsightUseCaseProtocol {
    
    private let repository: ExpenseRepositoryProtocol
    
    init(repository: ExpenseRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() throws -> Insight {
        // 1. Search all expenses from DataBase
        let allExpenses = try repository.fetchAllExpenses()
        
        // 2. Calculate total amount spend
        let totalAmount = allExpenses.reduce(0) { $0 + $1.amount }
        
        // 3. Find out category with most expenses (Business Logic)
        var categoryTotals: [Category : Double] = [:]
        for expense in allExpenses {
            categoryTotals[expense.category, default: 0] += expense.amount
        }
        
        let topCategory = categoryTotals.max { a, b in a.value < b.value }?.key
        
        // 4. Return insight
        return Insight(totalSpent: totalAmount,
                       topCategory: topCategory ?? .others,
                       totalReceiptsScanned: allExpenses.count
        )
  
    }
    
    
}
