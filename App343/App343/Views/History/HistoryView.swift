//
//  HistoryView.swift
//  App343
//
//  Created by DJUNA on 23/02/2024.
//

import SwiftUI

struct HistoryView: View {
    
    @StateObject var viewModel = GoalsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("My history")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                }
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                HStack {
                    
                    VStack {
                        
                        Text("Goals achieved")
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("\(viewModel.goalsAch)")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(10)
                        
                    }
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 1, height: 60)
                    
                    VStack {
                        
                        Text("Income by goals")
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("$\(viewModel.Income)")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(10)
                        
                    }
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 1, height: 60)
                    
                    VStack {
                        
                        Text("Upcoming Income")
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("$\(viewModel.Upcome)")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(10)
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 90)
                
                if viewModel.goals.isEmpty {
                    
                    VStack {
                        
                        Image(systemName: "checkmark.square")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .padding(8)
                        
                        Text("No history of completed goals")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("When you complete the goal, they will be displayed here and included in the statistics.")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: 300)
                            .multilineTextAlignment(.center)
                            .padding(1)
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(viewModel.goals, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.selectedGoal = index
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "checkmark.square")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 15, height: 15)
                                
                                Text(index.goalName ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                                    .lineLimit(1)
                                    .padding(.horizontal, 6)
                                
                                Spacer()
                                
                                Text(index.goalTMoney ?? "")
                                    .foregroundColor(.green)
                                    .font(.system(size: 16, weight: .semibold))
                                    .lineLimit(1)
                                    .padding(.horizontal, 6)
                                
                                Image("flags")
                            }
                        })
                    }
                }
            }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchGoals()
        }
    }
}

#Preview {
    HistoryView()
}
