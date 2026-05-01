//
//  OCRService.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 29/03/26.
//

import Foundation
import UIKit
import Vision

enum OCRError: Error {
    case invalidImageData
    case recognitionFailed(String)
}

final class VisionOCRService: OCRService {
    
    func extractText(from imageData: Data) async throws -> String {
        
        // 1. Convert Data to UIImage
        guard let uiImage = UIImage(data: imageData),
              let cgImage = uiImage.cgImage else {
            throw OCRError.invalidImageData
        }
        
        // 2. Transform an old API based on Completion Handler into Async/Await
        return try await withCheckedThrowingContinuation { continuation in
            
            // 3. Create request to OCR
            let request = VNRecognizeTextRequest { request, error in
                
                // Treat errors from framework
                if let error = error {
                    continuation.resume(throwing: OCRError.recognitionFailed(error.localizedDescription))
                    return
                }
                
                // Take blocks of knowed texts
                guard let observations = request.results as? [VNRecognizedTextObservation] else {
                    continuation.resume(returning: "")
                    return
                }
                
                // Join all lines on a single giant text
                let extractedText = observations.compactMap { observation in
                    // Pega o melhor palpite (top 1) da leitura
                    observation.topCandidates(1).first?.string
                }.joined(separator: "\n")
                
                // Returns text to Use Case
                continuation.resume(returning: extractedText)
            }
            
            // Configure to be more accurate on reading
            request.recognitionLevel = .accurate
            request.usesLanguageCorrection = true
            
            // 4. Execute handler
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            
            do {
                try handler.perform([request])
            } catch {
                continuation.resume(throwing: OCRError.recognitionFailed(error.localizedDescription))
            }
        }
    }
}
