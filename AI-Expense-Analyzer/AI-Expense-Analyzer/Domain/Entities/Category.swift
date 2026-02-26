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
                .yellow
        case .transportation:
                .green
        case .housing:
                .blue
        case .health:
                .red
        case .entertainment:
                .orange
        case .lifestyle:
                .purple
        }
    }
    
    static let categories: [Category] = [
        Category.food, Category.transportation, Category.housing, Category.health, Category.entertainment, Category.lifestyle
    ]

}


