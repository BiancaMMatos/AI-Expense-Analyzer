//
//  HomeView.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import SwiftUI


struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                if viewModel.isLoading {
                    ProgressView("Loading insights...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    InsightCard(
                        title: "Total Spend",
                        value: viewModel.totalSpentFormatted,
                        subtitle: viewModel.scannedReceiptsCount
                    )
                    .accessibilityIdentifier("homeView:insightCard:total_spend")
                    
                    InsightCard(
                        title: "Most Expended",
                        value: viewModel.topCategoryName,
                        subtitle: "Category"
                    )
                    .accessibilityIdentifier("homeView:insightCard:most_expended")
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("My Insights")
            .onAppear {
                viewModel.fetchInsight()
            }
        }
    }
}
