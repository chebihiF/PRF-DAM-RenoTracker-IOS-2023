//
//  RenovationProjectRepository.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 22/5/2023.
//

import Foundation

protocol RenovationProjectRepositoryProtocol {
    func fetchRenovationProjetcs(completion: ([RenovationProject]) -> Void)
    func fetchRenovationProjectTest(completion: (RenovationProject) -> Void )
}

class RenovationProjectRepository : RenovationProjectRepositoryProtocol{
    
    private let apiRenovationService: RenovationAPIService
    
    init(apiRenovationService: RenovationAPIService = RenovationAPIService()) {
        self.apiRenovationService = apiRenovationService
    }
    
    func fetchRenovationProjetcs(completion: ([RenovationProject]) -> Void) {
        apiRenovationService.fetchRenovationProjetcs(completion: completion)
    }
    
    func fetchRenovationProjectTest(completion: (RenovationProject) -> Void) {
        apiRenovationService.fetchRenovationProjectTest(completion: completion)
    }
    
}
