//
//  InsightExpenseRepository.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//


protocol InsightExpenseRepositoryProtocol {
    func getInsight(from expenses: [Expense]) -> Insight
}


struct InsightExpenseRepository: InsightExpenseRepositoryProtocol {
    
    private let service: InsightService
    
    func getInsight(from expenses: [Expense]) -> Insight {
        service.generateInsight(from: expenses)
    }
    
}
