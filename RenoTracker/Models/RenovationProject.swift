//
//  RenovationProject.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 22/5/2023.
//

import Foundation

struct RenovationProject {
    var projectNumber: Int = 0
    var renovationArea: String = ""
    var imageName: String = ""
    var dueDate: Date = Date.distantFuture
    var lastProgressUpdate: Date? = nil
    var workQuality: WorkQualityRating = .na
    var isFlagged: Bool = false
    var punchList: [PunchListItem] = []
    var budgetAmountAllocated: Double = 0.0
    var budgetSpentToDate: Double = 0.0
    var inspectionLog: [InspectionLogEntry] = []
    
    enum WorkQualityRating: String {
        case na = "N/A"
        case poor = "Poor"
        case fair = "Fair"
        case good = "Good"
        case excellent = "Excellent"
    }
}

struct PunchListItem {
    var task: String = ""
    var status: CompletionStatus = .notStarted
    
    enum CompletionStatus: String {
        case notStarted = "Not Started"
        case inProgress = "In Progress"
        case complete = "Complete"
    }
}

struct InspectionLogEntry {
    var entryDate: Date
    var details: String
}
