//
//  AddExpenseViewModel.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import Combine

final class AddExpenseViewModel: ObservableObject {
    let expenseUseCase: ExpenseUseCase
    let categoryUseCase: CategoryUseCaseProtocol
    
    init(expenseUseCase: ExpenseUseCase, categoryUseCase: CategoryUseCaseProtocol) {
        self.expenseUseCase = expenseUseCase
        self.categoryUseCase = categoryUseCase
    }
    
    func examineImage() {
        // Apply logic to open camera or gallery in order to examine image
        // Apply logic that can call function to select category by passing information about image
        // Send image to extract
    }
    
    func saveExpense() {
        expenseUseCase.saveExpense()
    }
}
