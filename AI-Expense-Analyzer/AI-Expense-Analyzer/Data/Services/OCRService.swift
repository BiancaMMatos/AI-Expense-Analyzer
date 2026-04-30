//
//  OCRService.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 29/03/26.
//

import UIKit
import Vision


final class VisionService: OCRService {
    func extractText(from imageData: Data) async throws -> String {
        "oi"
    }
    
    func extractText(from image: UIImage) async throws -> String {
        
        /// 1. Preparing image; converting UIImage to CGImage
        guard let cgImage = image.cgImage else {
            throw OCRServiceError.invalidImage
        }
        
        /// 2. Creating text request
        let request = VNRecognizeTextRequest()
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        
        /// 3. Executing OCR on image
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try handler.perform([request])
        
        /// 4. Extracting knowns texts
        let observations = request.results ?? []
        let lines = observations.compactMap { $0.topCandidates(1).first?.string }
        
        /// 5. Joining in a single string
        let fullText = lines.joined(separator: "\n")
        
        
        return fullText
    }
    
    
}
