//
//  ExpenseUseCase.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import Foundation

/// UseCase protocol
protocol AnalyzeReceiptUseCaseProtocol {
    func execute(imageData: Data) async throws -> ReceiptAnalysisResult
}

// MARK: - UseCase
struct AnalyzeReceiptUseCase: AnalyzeReceiptUseCaseProtocol {
    
    /// Dependency Injection
    private let ocrService: OCRService
    private let mlService: MLService
    
    init(ocrService: OCRService, mlService: MLService) {
        self.ocrService = ocrService
        self.mlService = mlService
    }
    
    func execute(imageData: Data) async throws -> ReceiptAnalysisResult {
        /// Extract full text from image
        let fullText = try await ocrService.extractText(from: imageData)
        
        /// Classify category from text
        let category = try await mlService.classify(text: fullText)
        
        
        /// Extract amount using business logic
        let value = extractMonetaryValue(from: fullText)
        
        /// Returns package ready for ViewModel
        return ReceiptAnalysisResult(extractedValue: value, category: category)
        
    }
    
    /// Regular expression made to find values (ex: 15.50 or 15,50)
    /// - Parameter text: String value from imageData
    /// - Returns: Amount showed at data
        private func extractMonetaryValue(from text: String) -> Double? {
            let pattern = "\\d+[.,]\\d{2}"
            do {
                let regex = try NSRegularExpression(pattern: pattern)
                let nsString = text as NSString
                let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
                
                // Assume que o valor total é geralmente o último valor monetário na fatura
                if let lastMatch = results.last {
                    let valueString = nsString.substring(with: lastMatch.range)
                    let cleanString = valueString.replacingOccurrences(of: ",", with: ".")
                    return Double(cleanString)
                }
            } catch {
                print("Erro ao processar regex: \(error)")
            }
            return nil
        }
    
}
