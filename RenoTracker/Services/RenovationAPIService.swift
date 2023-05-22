//
//  RenovationAPIService.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 22/5/2023.
//

import Foundation

protocol RenovationAPIServiceProtocol {
    func fetchRenovationProjetcs(completion: ([RenovationProject]) -> Void)
}

final class RenovationAPIService : RenovationAPIServiceProtocol {
    
    func fetchRenovationProjetcs(completion: ([RenovationProject]) -> Void) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let renovationProjects = [
            RenovationProject(projectNumber: 2021001,
                              renovationArea: "Front Lobby",
                              imageName: "front-lobby",
                              dueDate: dateFormatter.date(from: "2021-08-01")!,
                              lastProgressUpdate: dateFormatter.date(from: "2021-05-28")!,
                              workQuality: .good,
                              isFlagged: false,
                              punchList: [
                                PunchListItem(task: "Remodel front desk", status: .complete),
                                PunchListItem(task: "Retile entry", status: .complete),
                                PunchListItem(task: "Replace light fixtures", status: .complete),
                                PunchListItem(task: "Paint walls", status: .inProgress),
                                PunchListItem(task: "Hang new artwork", status: .notStarted)
                              ],
                              budgetAmountAllocated: 15000,
                              budgetSpentToDate: 18350.0,
                              inspectionLog: [
                                InspectionLogEntry(entryDate: Date().advanced(by: -1), details: "Test entry 1"), InspectionLogEntry(entryDate: Date(), details: "Test entry 2")])
            ,
            RenovationProject(projectNumber: 2021002,
                              renovationArea: "Main Entrance",
                              imageName: "main-entrance",
                              dueDate: dateFormatter.date(from: "2021-05-30")!,
                              lastProgressUpdate: nil,
                              workQuality: .fair,
                              isFlagged: true,
                              punchList: [
                                PunchListItem(task: "Replace front door", status: .notStarted),
                                PunchListItem(task: "Install security cameras", status: .notStarted)
                              ],
                              budgetAmountAllocated: 10000,
                              budgetSpentToDate: 0.0,
                              inspectionLog: [InspectionLogEntry(entryDate: Date(), details: "Test entry")])
        ]
        
        completion(.init(renovationProjects))
    }
}

