//
//  DetailView.swift
//  RenoTracker
//
//  Created by CHEBIHI FAYCAL on 22/5/2023.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack(alignment: .leading){
            Header()
            WorkQuality()
            Divider()
            PunchList()
            Divider()
            Budget()
            Spacer()
        }.padding(.all)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            DetailView()
            DetailView().preferredColorScheme(.dark)
        }
    }
}

// MARK: Header section
struct Header: View {
    var body: some View {
        VStack{
            Text("Front Lobby")
                .font(.largeTitle)
            Image("front-lobby")
                .resizable()
                .scaledToFit()
                .frame(width: 360)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 5)
                .overlay(Text("FLAGGED FOR REVIEW")
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
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.white)
                .opacity(0.9)
    
            VStack{
                HStack{
                    ProgressView(value: 0.6)
                    Text("60% Complete")
                }
                Text("Due on Sunday, August 1, 2023")
            }.padding()
        }.frame(width: 310, height: 100)
    }
}

// MARK: Status section
struct WorkQuality: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Work Quality")
                .font(.headline)
                .foregroundColor(.accentColor)
            HStack{
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }.foregroundColor(.yellow)
        }
    }
}

// MARK: Punch List section
struct PunchList: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Punch List")
                .font(.headline)
                .foregroundColor(.accentColor)
            
            Label("Remodel front desk", systemImage: "checkmark.circle")
            Label("Retile entry", systemImage: "checkmark.circle")
            Label("Replace light fixtures", systemImage: "checkmark.circle")
            Label("Paint walls", systemImage: "asterisk.circle")
            Label("Hang new artwork", systemImage: "circle")
        }
    }
}

// MARK: Budget section
struct Budget: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Budget")
                .font(.headline)
                .foregroundColor(.accentColor)
            
            Label(
                title: {Text("On Budget")},
                icon : { Image(systemName: "checkmark.circle.fill").foregroundColor(.green)}
            )
            
            HStack{
                Text("Amount Allocated : ")
                Spacer()
                Text("$15,000")
            }
            
            HStack{
                Text("Spend to-date : ")
                Spacer()
                Text("$8,350").underline()
            }
            
            HStack{
                Text("Amount remaining : ").bold()
                Spacer()
                Text("$6,650").bold()
            }
        }
    }
}


