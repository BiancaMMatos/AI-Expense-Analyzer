//
//  ExpenseRepository.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//


protocol ExpenseRepositoryProtocol {
    func fetchInsitedExpenses()
}


struct ExpenseRepository: ExpenseRepositoryProtocol {
    
    private let service: MLService
    
    func fetchInsitedExpenses() {
        service.generateInsight()
    }
    
    
}
