//
//  HomeViewModel.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import Combine

class HomeViewModel: ObservableObject {
    
    private var generateInsightUseCase: GenerateInsightUseCase?
    
    init(generateInsightUseCase: GenerateInsightUseCase? = nil) {
        self.generateInsightUseCase = generateInsightUseCase
    }
    
    func loadInsight() {
        generateInsightUseCase?.generateInsight()
    }
}
