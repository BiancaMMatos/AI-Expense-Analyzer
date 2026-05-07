//
//  HomeViewModel.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import Combine
import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    
    // MARK: - States of View
    @Published var totalSpentFormatted: String = "R$ 0,00"
    @Published var topCategoryName: String = "None"
    @Published var scannedReceiptsCount: String = "0 notes processed"
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    
    // MARK: - Dependencies
    private let generateInsightUseCase: GenerateInsightUseCaseProtocol
    
    
    // MARK: - Init
    init(generateInsightUseCase: GenerateInsightUseCaseProtocol) {
        self.generateInsightUseCase = generateInsightUseCase
    }
    
    // MARK: - Actions
    func fetchInsight() {
        isLoading = true
        errorMessage = nil
        
        do {
            
            // 1. Getting data
            let insight = try generateInsightUseCase.execute()
            
            // 2. Formating it
            self.totalSpentFormatted = formatCurrency(insight.totalSpent)
            self.topCategoryName = insight.topCategory.rawValue
            self.scannedReceiptsCount = "\(insight.totalReceiptsScanned) notes processed."
            
        } catch {
            self.errorMessage = "Error loading insights:\(error.localizedDescription)"
        }
    }
    
    // MARK: - Helpers Privados
    private func formatCurrency(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        
        // If formatter fails, it will have a safe fallback
        return formatter.string(from: NSNumber(value: value)) ?? "R$ \(String(format: "%.2f", value))"
    }
    
}
