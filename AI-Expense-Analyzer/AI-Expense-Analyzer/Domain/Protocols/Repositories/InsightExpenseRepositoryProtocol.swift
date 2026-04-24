//
//  InsightExpenseRepositoryProtocol.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 23/04/26.
//


protocol InsightExpenseRepositoryProtocol {
    func getInsight(from expenses: [Expense]) -> Insight
}
