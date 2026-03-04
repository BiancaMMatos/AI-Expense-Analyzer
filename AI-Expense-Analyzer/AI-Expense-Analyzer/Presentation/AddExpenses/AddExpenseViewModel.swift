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
    
    func selectCategoryFromImage() {
        categoryUseCase.selectCategory()
    }
    
    func saveExpense() {
        expenseUseCase.saveExpense()
    }
}
