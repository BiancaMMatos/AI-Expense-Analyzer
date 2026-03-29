//
//  CategoryRepository.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import UIKit

protocol CategoryRepository {
    func selectCategory(from image: UIImage) async throws -> Any
}

// MARK: - Default
struct DefaultCategoryRepository: CategoryRepository {
    
    let ocrService: OCRService
    let mlService: MLService
    
    func selectCategory(from image: UIImage) async throws -> Any {
        do {
            let ocrResult = try await ocrService.extractText(from: image)
            let mlResult = try await mlService.classify(text: ocrResult)
            
            return mlResult
            
        } catch {
            throw error
        }
    }
    
    
}
