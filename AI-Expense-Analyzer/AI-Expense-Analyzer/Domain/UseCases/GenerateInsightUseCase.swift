//
//  GenerateInsightUseCase.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import Foundation

struct GenerateInsightUseCase {
    private var repository: InsightExpenseRepositoryProtocol
    var expenses: [Expense]
    
    
    func generateInsight() -> Insight {
        repository.getInsight(from: expenses)
    }
}
