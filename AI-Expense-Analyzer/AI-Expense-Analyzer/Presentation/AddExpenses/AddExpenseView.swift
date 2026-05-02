//
//  AddExpenseView.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 15/02/26.
//

import SwiftUI

struct AddExpenseView: View {
    @StateObject var viewModel: AddExpenseViewModel
    @Environment(\.dismiss) var dismiss
    @State private var showingImagePicker = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    
                    // MARK: - 1. Image Area
                    ZStack {
                        if let image = viewModel.selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                )
                        } else {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.gray.opacity(0.1))
                                .frame(height: 200)
                                .overlay(
                                    CameraButton {
                                        showingImagePicker = true
                                    }
                                )
                        }
                        
                        if viewModel.isProcessingImage {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.black.opacity(0.6))
                                .frame(height: 200)
                                .overlay(
                                    VStack(spacing: 12) {
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                        Text("Analyzing note...")
                                            .font(.caption.bold())
                                            .foregroundColor(.white)
                                    }
                                )
                        }
                    }
                    .padding(.horizontal)
                    
                    // MARK: - 2. Value Text
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Valor da Despesa")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Text("R$")
                                .font(.title2.bold())
                                .foregroundColor(.primary)
                            
                            TextField("0,00", text: $viewModel.amountText)
                                .keyboardType(.decimalPad)
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - 3. Category Grid
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Category")
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                        
                        CategoryGrid(selectedCategory: $viewModel.selectedCategory)
                    }
                    
                    Spacer(minLength: 32)
                    
                    // MARK: - 4. Save Button
                    SaveButton(isSaving: viewModel.isSaving) {
                        viewModel.saveExpense()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 16)
                }
                .padding(.vertical)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
            }
            // MARK: - State observers
            .onChange(of: viewModel.didSaveSuccessfully) { newValue, _ in
                if newValue {
                    dismiss()
                }
            }
            
            .alert("Alert", isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil }
            )) {
                Button("OK", role: .cancel) { }
            } message: {
                if let error = viewModel.errorMessage {
                    Text(error)
                }
            }
            
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(selectedImage: Binding<UIImage?>(
                    get: { viewModel.selectedImage },
                    set: { image in
                        if let validImage = image {
                            viewModel.processImage(validImage)
                        }
                    }
                ))
            }
        }
    }
}

