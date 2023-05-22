//
//  RenovationProjectsView.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 22/5/2023.
//

import SwiftUI

struct RenovationProjectsView: View {
    var body: some View {
        VStack{
            // MARK: Header section
            VStack{
                Text("Front Lobby")
                Text("<<< Photo Placeholder >>>") // TODO: Get Photo and show here
            }
            
            // MARK: Status section
            VStack{
                Text("60% Complete")
                Text("Work Quality : Good")
                Text("Due on Sunday, August 1, 2023")
                Text("On Buddget")
                Text("FLAGGED FOR REVIEW")
            }
            
            // MARK: Punch List section
            VStack{
                Text("Punch List")
                
                Text("Remodel front desk")
                Text("Retile entry")
                Text("Replace light fixtures")
                Text("Paint walls")
                Text("Hang new artwork")
            }
            
            // MARK: Budget section
            VStack{
                Text("Budget")
                
                HStack{
                    Text("Amount Allocated : ")
                    Text("$15,000")
                }
                
                HStack{
                    Text("Spend to-date : ")
                    Text("$8,350")
                }
                
                HStack{
                    Text("Amount remaining : ")
                    Text("$6,650")
                }
            }
        }
    }
}

struct RenovationProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        RenovationProjectsView()
    }
}
