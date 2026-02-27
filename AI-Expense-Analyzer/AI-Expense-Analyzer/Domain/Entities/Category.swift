//
//  Category.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import SwiftUI

enum Category: String {
    case food
    case transportation
    case housing
    case health
    case entertainment
    case lifestyle
    
    var color: Color {
        switch self {
        case .food:
                .init(.systemYellow)
            
        case .transportation:
                .init(.systemGreen)
            
        case .housing:
                .init(.systemBlue)
            
        case .health:
                .init(.systemRed)
            
        case .entertainment:
                .init(.systemOrange)
            
        case .lifestyle:
                .init(.systemPurple)
        }
    }
    
    static let categories: [Category] = [
        Category.food, Category.transportation, Category.housing, Category.health, Category.entertainment, Category.lifestyle
    ]

}


