//
//  CoreMLCategoryService.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import CoreML
import NaturalLanguage

final class CoreMLCategoryService: MLService {
    func classify(text: String) async throws -> Category {
        // TODO: Add Logic
        /// Import ML model from Apple; pass 'text' and it returns which 'Category' it think it is
        
        /// Example:
        if text.lowercased().contains("restaurant") || text.lowercased().contains("ifood") {
            return .food
        }
        
        return .others
    }

    
}
