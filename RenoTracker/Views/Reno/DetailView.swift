//
//  DetailView.swift
//  RenoTracker
//
//  Created by  FAYCAL on 22/5/2023.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var viewModel: RenovationProjectViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Header()
            WorkQuality()
            Divider()
            PunchList()
            Divider()
            Budget()
            Spacer()
        }
        .padding(.all)
        .navigationTitle(viewModel.renovationProjectTest.renovationArea)
        .sheet(isPresented: .constant(false), content:{
          EditView()
        })
       
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel: RenovationProjectViewModel = RenovationProjectViewModel()
        Group{
            NavigationView
            {
                DetailView().environmentObject(viewModel).onAppear{
                    viewModel.onAppear()
                }
            }
            NavigationView
            {
                DetailView().environmentObject(viewModel).onAppear{
                    viewModel.onAppear()
                }.preferredColorScheme(.dark)
            }
                
        }
    }
}

// MARK: Header section
struct Header: View {
    @EnvironmentObject var viewModel: RenovationProjectViewModel
    var body: some View {
        VStack{
            Image(viewModel.renovationProjectTest.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 360)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 5)
                .overlay(
                    Text(viewModel.renovationProjectTest.isFlagged ? "FLAGGED FOR REVIEW" : "")
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.black.opacity(0.8)).padding(),alignment: .topTrailing)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 5)
                )
                .overlay(
                    ProgressInfoCard()
                        .padding(), alignment: .bottom
                )
        }
    }
}

// MARK: Progress Info Card
struct ProgressInfoCard: View {
    @EnvironmentObject var viewModel: RenovationProjectViewModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.white)
                .opacity(0.9)
    
            VStack{
                HStack{
                    ProgressView(value: viewModel.renovationProjectTest.percentComplete)
                    Text(viewModel.renovationProjectTest.formattedPercentComplete)
                }
                Text("Due on \(viewModel.renovationProjectTest.formattedDueDate)")
            }.padding()
        }.frame(width: 310, height: 100)
    }
}

// MARK: Status section
struct WorkQuality: View {
    @EnvironmentObject var viewModel: RenovationProjectViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("Work Quality")
                .font(.headline)
                .foregroundColor(.accentColor)
                .padding(.bottom, 2)
            
            workQualitySymbol
                .foregroundColor(viewModel.renovationProjectTest.workQuality == .na ? .gray : .yellow)
                .font(.title3)
                .accessibility(hidden: true)
        }
    }
    
    var workQualitySymbol: some View {
        HStack {
            // First Star
            if [.poor, .fair, .good, .excellent].contains(viewModel.renovationProjectTest.workQuality){
                Image(systemName: "star.fill")
            }else{
                Image(systemName: "star")
            }
            
            // Second Star
            if [.fair, .good, .excellent].contains(viewModel.renovationProjectTest.workQuality){
                Image(systemName: "star.fill")
            }else{
                Image(systemName: "star")
            }
            
            // Third Star
            if [.good, .excellent].contains(viewModel.renovationProjectTest.workQuality){
                Image(systemName: "star.fill")
            }else{
                Image(systemName: "star")
            }
            
            // Fourth Star
            if [.excellent].contains(viewModel.renovationProjectTest.workQuality){
                Image(systemName: "star.fill")
            }else{
                Image(systemName: "star")
            }
        }
    }
}



// MARK: Punch List section
struct PunchList: View {
    @EnvironmentObject var viewModel: RenovationProjectViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("Punch List")
                .font(.headline)
                .foregroundColor(.accentColor)
                .padding(.bottom, 2)
            
            ForEach(viewModel.renovationProjectTest.punchList, id: \.task){ puchListItem in
                Label(
                    title: { Text(puchListItem.task) },
                    icon: { puchListItem.completionStatusSymbol }
                )
            }
           
        }
    }
}



// MARK: Budget section
struct Budget: View {
    @EnvironmentObject var viewModel: RenovationProjectViewModel
   
    var body: some View {
        VStack(alignment: .leading){
            Text("Budget")
                .font(.headline)
                .foregroundColor(.accentColor)
                .padding(.bottom, 2)
            
            Label(
                title: {Text(viewModel.renovationProjectTest.budgetStatus.rawValue)},
                icon : { viewModel.renovationProjectTest.budgetStatusSymbol
                    .foregroundColor(viewModel.renovationProjectTest.budgetStatusForegroundColor) }
            )
            
            HStack{
                Text("Amount Allocated : ")
                Spacer()
                Text(viewModel.renovationProjectTest.formattedBudgetAmountAllocated)
            }
            
            HStack{
                Text("Spend to-date : ")
                Spacer()
                Text(viewModel.renovationProjectTest.formattedBudgetSpentToDate).underline()
            }
            
            HStack{
                Text("Amount remaining : ").bold()
                Spacer()
                Text(viewModel.renovationProjectTest.formattedBudgetAmountRemaining).bold()
            }
        }
    }
}


