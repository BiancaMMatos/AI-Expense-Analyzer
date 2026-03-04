//
//  AddExpenseViewModel.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import Combine

final class AddExpenseViewModel: ObservableObject {
    let categoryUseCase: CategoryUseCase
    
    init(categoryUseCase: CategoryUseCase) {
        self.categoryUseCase = categoryUseCase
    }
    
    func selectCategoryFromImage() {
        categoryUseCase.selectCategory()
    }
}
