//
//  ExpenseCard.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import SwiftUI

struct ExpenseCard: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let categoryName: String
    let dateString: String
    let amountString: String
    let systemIconName: String
    
    var body: some View {
        HStack(spacing: 16) {

            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.1))
                    .frame(width: 48, height: 48)
                
                Image(systemName: systemIconName)
                    .font(.title3)
                    .foregroundColor(.blue)
            }
            

            VStack(alignment: .leading, spacing: 4) {
                Text(categoryName)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(dateString)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(amountString)
                .font(.system(.title3, design: .rounded).weight(.semibold))
                .foregroundColor(colorScheme == .dark ? .white : .primary)
        }
        .padding(16)
        .background(colorScheme == .dark ? Color(UIColor.systemGray6) : .white)
        .cornerRadius(16)
        .shadow(color: colorScheme == .dark ? .white.opacity(0.05) : .black.opacity(0.05), radius: 5, y: 2)
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        Color(UIColor.systemGroupedBackground).ignoresSafeArea()
        
        VStack(spacing: 16) {
            ExpenseCard(
                categoryName: "Food",
                dateString: "15 de Fev, 14:30",
                amountString: "R$ 154,90",
                systemIconName: "fork.knife"
            )
            
            ExpenseCard(
                categoryName: "Transportation",
                dateString: "14 de Fev, 09:15",
                amountString: "R$ 45,00",
                systemIconName: "car.fill"
            )
        }
        .padding()
    }
}
