//
//  CameraPermissionManager.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 23/04/26.
//

import AVFoundation

final class CameraPermissionManager: CameraPermissionManaging {
    func checkAndRequestPermission(completion: @escaping (Bool) -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .authorized:
            completion(true)
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    completion(granted)
                }
            }
            
        case .restricted, .denied:
            completion(false)
            
        @unknown default:
            completion(false)
        }
    }
    
    
}
