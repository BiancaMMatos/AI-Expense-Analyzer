//
//  InsightExpenseRepository.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//


protocol InsightExpenseRepositoryProtocol {
    func fetchInsightFromExpenses()
}


struct InsightExpenseRepository: InsightExpenseRepositoryProtocol {
    
    private let service: MLService
    
    func fetchInsightFromExpenses() {
        service.generateInsight()
    }
    
    
}
