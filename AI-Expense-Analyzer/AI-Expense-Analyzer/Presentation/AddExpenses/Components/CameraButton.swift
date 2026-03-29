//
//  CameraButton.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 12/03/26.
//

import SwiftUI

struct CameraButton: View {
    
    private var colorScheme: ColorScheme
    private var viewModel: AddExpenseViewModel
    
    init(_ colorScheme: ColorScheme, _ viewModel: AddExpenseViewModel) {
        self.colorScheme = colorScheme
        self.viewModel = viewModel
    }
    
    var body: some View {
        Button {
            viewModel.examineImage()
            
        } label: {
            Image(systemName: "camera.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundStyle(colorScheme == .dark ? .white : .black)
                .padding(20)
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .shadow(radius: 5.0)
        }
        .padding(20)
    }
}

#Preview {
    CameraButton(.dark, AddExpenseViewModelFactory.makeViewModel())
}
