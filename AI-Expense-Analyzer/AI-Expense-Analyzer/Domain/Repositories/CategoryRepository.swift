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
    
    let service: OCRService
    
    func selectCategory(from image: UIImage) async throws -> Any {
        do {
            let result = try await service.extractText(from: image)
            return result
            
        } catch {
            throw error
        }
    }
    
    
}
