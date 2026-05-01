//
//  ExpensesCategoryViewModel.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 30/04/26.
//

import Combine
import Foundation

@MainActor
final class ExpensesCategoryViewModel: ObservableObject {
    
    // Dict that contains totals that View will show when set cards up
    @Published var categoryTotals: [Category: Double] = [:]
    @Published var errorMessage: String? = nil
    
    private let fetchUseCase: FetchExpensesByCategoryUseCaseProtocol
    
    init(fetchUseCase: FetchExpensesByCategoryUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }
    
    func loadTotals() {
        self.errorMessage = nil
        do {
            self.categoryTotals = try fetchUseCase.execute()
        } catch {
            self.errorMessage = "Erro ao carregar categorias: \(error.localizedDescription)"
        }
    }
    
    // Helper to format value (money) into Card
    func formatCurrency(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: value)) ?? "R$ \(String(format: "%.2f", value))"
    }
}
