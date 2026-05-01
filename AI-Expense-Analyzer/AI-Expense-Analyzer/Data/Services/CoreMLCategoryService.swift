//
//  CoreMLCategoryService.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import CoreML
import NaturalLanguage

final class CoreMLCategoryClassifier: MLService {
    
    func classify(text: String) async throws -> Category {
        
        // TODO: Adjust Logic
        
        let lowercasedText = text.lowercased()
        
        let foodKeywords = ["restaurante", "ifood", "mercado", "padaria", "supermercado", "lanchonete", "burger", "pizza"]
        let transportKeywords = ["uber", "99", "posto", "combustível", "gasolina", "estacionamento", "pedágio"]
        let healthKeywords = ["farmácia", "drogaria", "hospital", "clínica", "consulta", "exame"]
        let educationKeywords = ["escola", "faculdade", "curso", "livraria", "udemy"]
        
        if foodKeywords.contains(where: lowercasedText.contains) {
            return .food
        } else if transportKeywords.contains(where: lowercasedText.contains) {
            return .transportation
        } else if healthKeywords.contains(where: lowercasedText.contains) {
            return .health
        } else if educationKeywords.contains(where: lowercasedText.contains) {
            return .education
        }
        
        
        return .others
    }
    
    
}
