//
//  InsightCard.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import SwiftUI

struct InsightCard: View {
    var body: some View {
        GeometryReader { reader in
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.background)
                    .shadow(radius: 1.6)
                    .frame(width: (reader.size.width * 0.93), height: (reader.size.width * 0.53))
                    .padding(.horizontal, reader.size.width * 0.04)
                
                Text("Texto")
                    .font(.title2)
                    .foregroundStyle(.gray)
                    .lineLimit(0)
                    
            }
        }
    }
}

#Preview {
    InsightCard()
}
