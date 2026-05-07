//
//  Category.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    case food = "Food"
    case transportation = "Transportation"
    case health = "Health"
    case education = "Education"
    case housing = "Housing"
    case entertainment = "Entertainment"
    case lifestyle = "Lifestyle"
    case others = "Others"
    
    var id: String { self.rawValue }
    
    var icon: String {
        switch self {
        case .food:
            "fork.knife"
            
        case .transportation:
            "car.fill"
            
        case .housing:
            "house.fill"
            
        case .health:
            "stethoscope"
            
        case .entertainment:
            "theatermasks.fill"
            
        case .lifestyle:
            "figure.strengthtraining.functional"
            
        case .others:
            "ellipsis"
            
        case .education:
            "graduationcap.fill"
        }
        
    }
    
    static let categories: [Category] = [
        Category.food, Category.transportation, Category.housing, Category.health, Category.entertainment, Category.lifestyle, Category.education, Category.others
    ]
    
}
