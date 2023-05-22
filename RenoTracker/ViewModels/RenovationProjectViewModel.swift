//
//  RenovationProjectViewModel.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 22/5/2023.
//

import Foundation

final class RenovationProjectViewModel : ObservableObject {
    
    @Published var renovationProjectTest : RenovationProject = RenovationProject()
    
    private let renovationProjectRepository : RenovationProjectRepository
    
    init (renovationProjectRepository: RenovationProjectRepository = RenovationProjectRepository()){
        self.renovationProjectRepository = renovationProjectRepository
    }
    
    func onAppear() {
        renovationProjectRepository.fetchRenovationProjectTest{ renovationProjectTest in
            self.renovationProjectTest = renovationProjectTest
        }
    }
    
}
