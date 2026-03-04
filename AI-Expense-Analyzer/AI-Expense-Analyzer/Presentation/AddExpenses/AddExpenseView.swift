//
//  AddExpenseView.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import SwiftUI

struct AddExpenseView: View {
    
    @State private var value: String = ""
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack(alignment: .center) {
                Text("New Expense")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.trailing, 200)
                
                Button {
                    print("button pressed")
                    
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
                
                Form {
                    Section {
                        TextField("Value", text: $value)
                            .font(.callout)
                            .padding()
                        
                    } header: {
                        Text("Value Info")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(colorScheme == .dark ? .white : .gray)
                    }

                }
                .scrollContentBackground(.hidden)
                .background(Color(.systemGray5))
                .padding(20)
                .clipShape(RoundedRectangle(cornerRadius: 40))
            
                
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 30.0) {
                    ForEach(Category.categories, id: \.self) { category in
                        Button {
                            print("button pressed")
                            
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
                
                Button {
                    print("Saved")
                    
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
    }
}

#Preview {
    AddExpenseView()
}
