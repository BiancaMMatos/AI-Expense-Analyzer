//
//  CoreMLService.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import CoreML

final class CoreMLService: MLService {
    func classify(text: String) async throws -> Category {
        // TODO: Logic to classify
        return Category.entertainment /// mocked
    }

    
}
