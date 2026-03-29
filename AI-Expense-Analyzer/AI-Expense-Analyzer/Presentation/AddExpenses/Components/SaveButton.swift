//
//  SaveButton.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 12/03/26.
//

import SwiftUI

struct SaveButton: View {
    
    private var viewModel: AddExpenseViewModel
    
    init(_ viewModel: AddExpenseViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Button {
            print("Saved")
            viewModel.saveExpense()
            
        } label: {
            ZStack {
                
                Text("Save")
                    .font(.title3)
                    .fontWeight(.medium)
                    .tint(.black)
                    .padding(.horizontal, 50)
                    .padding(15)
                    .background(Color(.systemYellow))
                    .clipShape(RoundedRectangle(cornerRadius: 50.0))
                    .accessibilityIdentifier("addExpense:saveButton")
            }
        }
    }
}

#Preview {
    SaveButton(AddExpenseViewModelFactory.makeViewModel())
}
