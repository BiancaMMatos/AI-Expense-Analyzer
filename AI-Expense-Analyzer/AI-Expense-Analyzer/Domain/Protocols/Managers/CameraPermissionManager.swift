//
//  CameraPermissionManager.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 23/04/26.
//

// MARK: - Protocols

/// Contract made for camera permissions
protocol CameraPermissionManaging {
    func checkAndRequestPermission(completion: @escaping (Bool) -> Void)
}
