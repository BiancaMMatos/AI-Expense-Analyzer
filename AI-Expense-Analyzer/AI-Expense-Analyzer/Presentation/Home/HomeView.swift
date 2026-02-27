//
//  HomeView.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    Text("Hello, Bianca!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading, -150)
                        .padding(.top, 1)
                    
                    InsightCard()
                        .padding(.top, 10)
                        .padding(.bottom, -10)
                        .accessibilityIdentifier("homeView:insightCard")
                    
                    ScrollView(.vertical) {
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], content: {
                            ForEach(Category.categories, id: \.self) { category in
                                NavigationLink(destination: ExpensesCategoryView(category: category)) {
                                    ExpenseCard(category: category )
                                        .padding(.horizontal, 10)
                                }
                            }
                        })
                        
                    }
                    .padding(.top, -60)
                    .padding(.bottom, -10)
                    
                }
                .toolbar {
                    ToolbarItem {
                        NavigationLink {
                            AddExpenseView()
                                .accessibilityIdentifier("homeView:addExpense")
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    HomeView()
}
