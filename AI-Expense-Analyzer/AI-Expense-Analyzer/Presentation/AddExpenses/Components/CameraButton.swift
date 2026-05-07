//
//  CameraButton.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 12/03/26.
//

import SwiftUI

struct CameraButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action() // Reacts alert to whom called
        }) {
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 70, height: 70)
                    .shadow(radius: 5)
                
                Image(systemName: "camera.fill")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    CameraButton(action: {
        print("Camera button clicked!")
    })
}
