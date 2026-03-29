//
//  ExpenseUseCase.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import Foundation

protocol ExpenseUseCase {
    func saveExpense()
}


struct DefaultSaveExpenseUseCase: ExpenseUseCase {
    
    let repository: ExpenseRepository
    
    init(repository: ExpenseRepository) {
        self.repository = repository
    }
    
    func saveExpense() {
        repository
    }
    
    
}
