//
//  ExpensesCategoryView.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import SwiftUI

struct ExpensesCategoryView: View {
    
    let category: Category
    
    var body: some View {
        Text("ExpensesCategoriesView")
            .navigationTitle(category.rawValue.capitalized)
    }
}

#Preview {
    ExpensesCategoryView(category: .entertainment)
}
