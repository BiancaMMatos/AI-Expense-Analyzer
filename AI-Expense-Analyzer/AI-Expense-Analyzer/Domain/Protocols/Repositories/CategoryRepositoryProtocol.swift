//
//  CategoryRepositoryProtocol.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 23/04/26.
//

import UIKit

protocol CategoryRepository {
    func fetchCategories() throws -> [Category]
}
