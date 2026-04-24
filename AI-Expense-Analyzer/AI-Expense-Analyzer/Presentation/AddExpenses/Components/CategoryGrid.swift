//
//  CategoryGrid.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 12/03/26.
//

import SwiftUI

struct CategoryGrid: View {
    
    private var colorScheme: ColorScheme
    private var viewModel: AddExpenseViewModel
    
    init(_ colorScheme: ColorScheme, _ viewModel: AddExpenseViewModel) {
        self.colorScheme = colorScheme
        self.viewModel = viewModel
    }
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 30.0) {
            ForEach(Category.categories, id: \.self) { category in
                Button {
                    print("\(category) category button selected")
                    viewModel.examineImage()
                    
                } label: {
                    Image(systemName: category.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                        .padding(20)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                        .shadow(radius: 5.0)
                }
            }
        }
        .padding(50)
    }
}

#Preview {
    CategoryGrid(.dark, AddExpenseViewModelFactory.makeViewModel())
}
