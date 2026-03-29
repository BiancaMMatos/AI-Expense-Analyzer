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
    
    func showInsight() -> Insight {
        guard let generateInsightUseCase else {
           return Insight(text: "No data found")
        }
        return generateInsightUseCase.generateInsight()
    }
}
