//
//  ExpenseCard.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import SwiftUI

struct ExpenseCard: View {
    
    var category: Category
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .fill(category.color)
                .shadow(radius: 1.6)
                .frame(height: 150.0)
                .accessibilityIdentifier("expenseCard:\(category.rawValue)")
            
            VStack {
                Image(systemName: category.icon)
                    .scaledToFill()
                    .tint(.black)
                
                Text(category.rawValue.capitalized)
                    .font(.callout)
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                    .lineLimit(0)
            }
            
        }
        
    }
}

#Preview {
    ExpenseCard(category: .transportation )
}
