//
//  RenoTrackerApp.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 22/5/2023.
//

import SwiftUI

@main
struct RenoTrackerApp: App {
    var body: some Scene {
        var viewModel = RenovationProjectViewModel()
        WindowGroup {
            DetailView().environmentObject(viewModel).onAppear{
                viewModel.onAppear()
            }
        }
    }
}
