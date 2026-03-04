//
//  ExpenseRepository.swift
//  AI-Expense-Analyzer
//
//  Created by Bianca Maciel on 03/03/26.
//

import Foundation

protocol ExpenseRepositoryProtocol {
    func save()
}


struct ExpenseRepository: ExpenseRepositoryProtocol {
    
    let service: CoreDataService
    
    init(service: CoreDataService) {
        self.service = service
    }
    
    func save() {
        service.saveData()
    }
    
    
}
