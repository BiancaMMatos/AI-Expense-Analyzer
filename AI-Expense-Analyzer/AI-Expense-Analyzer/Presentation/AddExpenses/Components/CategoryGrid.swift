//
//  CategoryGrid.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 12/03/26.
//

import SwiftUI

struct CategoryGrid: View {
    // Binding creates a connection with ViewModel
    @Binding var selectedCategory: Category
    
    // Define layout grid
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            // Category.allCases works perfectly because the Enum assigns CaseIterable
            ForEach(Category.allCases) { category in
                CategoryItem(
                    title: category.rawValue,
                    isSelected: category == selectedCategory
                )
                .onTapGesture {
                    // Update selection with smooth animation
                    withAnimation(.spring()) {
                        selectedCategory = category
                    }
                }
            }
        }
        .padding()
    }
}

private struct CategoryItem: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .font(.subheadline.weight(.semibold))
            .foregroundColor(isSelected ? .white : .primary)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color.blue : Color.gray.opacity(0.1))
            )
            .shadow(color: isSelected ? Color.blue.opacity(0.3) : .clear, radius: 4, y: 2)
    }
}

#Preview {
    struct CategoryGridPreview: View {
        @State private var previewCategory: Category = .food
        
        var body: some View {
            CategoryGrid(selectedCategory: $previewCategory)
        }
    }
    return CategoryGridPreview()
}
