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
        }
    }
    
    static let categories: [Category] = [
        Category.food, Category.transportation, Category.housing, Category.health, Category.entertainment, Category.lifestyle
    ]

}


