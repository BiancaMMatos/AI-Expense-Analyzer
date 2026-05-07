//
//  SaveButton.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 12/03/26.
//

import SwiftUI

struct SaveButton: View {
    
    var title: String = "Save Expense"
    var isSaving: Bool // Receives ViewModel if has to save
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            
            if !isSaving { // Only executes if NOT have to save
                action()
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(isSaving ? Color.blue.opacity(0.6) : Color.blue)
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
                
                if isSaving {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
        }
        .disabled(isSaving)
        .animation(.easeInOut, value: isSaving)
    }
}

#Preview {
    VStack(spacing: 20) {
        SaveButton(isSaving: false, action: {})
        SaveButton(isSaving: true, action: {})
    }
    .padding()
}
