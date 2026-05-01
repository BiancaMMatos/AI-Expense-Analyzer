//
//  AddExpenseViewModel.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import SwiftUI
import Combine

@MainActor
final class AddExpenseViewModel: ObservableObject {
    
    // MARK: - View Status
    @Published var selectedImage: UIImage? = nil

    @Published var amountText: String = ""
    @Published var selectedCategory: Category = .others
    
    // MARK: - Interface Controls
    @Published var isProcessingImage: Bool = false
    @Published var isSaving: Bool = false
    @Published var errorMessage: String? = nil
    @Published var didSaveSuccessfully: Bool = false // (dismiss)
    
    // MARK: - Dependencies
    private let analyzeReceiptUseCase: AnalyzeReceiptUseCaseProtocol
    private let saveExpenseUseCase: SaveExpenseUseCaseProtocol
    
    init(analyzeReceiptUseCase: AnalyzeReceiptUseCaseProtocol,
         saveExpenseUseCase: SaveExpenseUseCaseProtocol) {
        self.analyzeReceiptUseCase = analyzeReceiptUseCase
        self.saveExpenseUseCase = saveExpenseUseCase
    }
    
    // MARK: - Actions
    
    /// Called when user takes a picture or select from library
    func processImage(_ image: UIImage) {
        self.selectedImage = image
        self.isProcessingImage = true
        self.errorMessage = nil
        
        /// 1. Convert UIImage to Data
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            self.errorMessage = "Error to process image."
            self.isProcessingImage = false
            return
        }
        
        /// 2. Call AI
        Task {
            do {
                let result = try await analyzeReceiptUseCase.execute(imageData: imageData)
                
                /// 3. Update screen with results
                self.selectedCategory = result.category
                
                if let value = result.extractedValue {
                    /// Transform Double into String with 2 decimals to TextField
                    self.amountText = String(format: "%.2f", value).replacingOccurrences(of: ".", with: ",")
                } else {
                    self.amountText = ""
                    self.errorMessage = "Couldn't identify value. Please, type manually."
                }
                
            } catch {
                self.errorMessage = "Failed to analyze note: \(error.localizedDescription)"
            }
            
            self.isProcessingImage = false
        }
    }
    
    /// Called when user clicks 'Save' button
    func saveExpense() {
        self.isSaving = true
        self.errorMessage = nil
        
        /// 1. Convert text (String) back to Double
        let cleanText = amountText.replacingOccurrences(of: "R$", with: "")
                                  .replacingOccurrences(of: " ", with: "")
                                  .replacingOccurrences(of: ",", with: ".")
        
        guard let amount = Double(cleanText), amount > 0 else {
            self.errorMessage = "Please, insert a valid value greater thabn zero."
            self.isSaving = false
            return
        }
        
        /// 2. Try to save into DataBase using UseCase
        do {
            try saveExpenseUseCase.execute(amount: amount, category: selectedCategory)
            self.didSaveSuccessfully = true
        } catch {
            self.errorMessage = "Error saving: \(error.localizedDescription)"
        }
        
        self.isSaving = false
    }
}
