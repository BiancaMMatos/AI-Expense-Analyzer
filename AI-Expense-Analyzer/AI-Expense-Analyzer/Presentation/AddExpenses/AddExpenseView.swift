//
//  AddExpenseView.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import SwiftUI

struct AddExpenseView: View {
    
    @State private var value: String = "0"
    @StateObject private var viewModel = AddExpenseViewModelFactory.makeViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ScrollView {
                
                VStack(alignment: .center) {
                    Text("New Expense")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.trailing, 200)
                    
                    CameraButton(colorScheme)
                    
                    ValueCard(value, colorScheme)
                    
                    CategoryGrid(colorScheme, viewModel)
                    
                    SaveButton(viewModel)
                    
                    
                }
                .background(Color(.systemBackground))
            
            
        }
    }
}

#Preview {
    AddExpenseView()
}
