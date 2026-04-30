//
//  ExpenseRepositoryProtocol.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 23/04/26.
//

import Foundation

/// Defines DataBase operations without telling which one
protocol ExpenseRepositoryProtocol {
    /// Save Expense on DataBase
    /// - Parameter expense: Expense
    func save(expense: Expense) throws
    
    /// Fetch All Expenses on DataBase
    /// - Returns: Expense
    func fetchAllExpenses() throws -> [Expense]
    
    /// Delete expense on DataBase
    /// - Parameter expense: Expense
    func delete(expense: Expense) throws
}
