//
//  ValueCard.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 12/03/26.
//

import SwiftUI

struct ValueCard: View {
    
    private var value: String
    private var colorScheme: ColorScheme
    
    init(_ value: String, _ colorScheme: ColorScheme) {
        self.value = value
        self.colorScheme = colorScheme
    }
    
    var body: some View {
        Section {
            Text("R$ " + value)
                .font(.title)
                .padding()
            
        } header: {
            Text("Value Informed")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(colorScheme == .dark ? .white : .gray)
        }
        
    }
}

#Preview {
    ValueCard("30", .light)
}
