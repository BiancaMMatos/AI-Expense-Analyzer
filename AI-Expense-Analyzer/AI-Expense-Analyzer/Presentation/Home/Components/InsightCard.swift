//
//  InsightCard.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import SwiftUI

struct InsightCard: View {
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: - Properties
    let title: String
    let value: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text(title)
                .font(.headline)
                .foregroundStyle(.gray)
            
            Text(value)
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(colorScheme == .dark ? .white : .primary)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(colorScheme == .dark ? Color(UIColor.systemGray6) : .white)
        .cornerRadius(20)
        .shadow(color: colorScheme == .dark ? .white.opacity(0.05) : .black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        Color(UIColor.systemGroupedBackground).ignoresSafeArea()
        
        VStack(spacing: 20) {
            InsightCard(
                title: "Total Spend",
                value: "R$ 1.540,50",
                subtitle: "12 notes processed."
            )
            
            InsightCard(
                title: "More Spent",
                value: "Food",
                subtitle: "Most frequent Category"
            )
        }
        .padding()
    }
}
