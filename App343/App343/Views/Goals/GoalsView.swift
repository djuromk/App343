//
//  GoalsView.swift
//  App343
//
//  Created by DJUNA on 23/02/2024.
//

import SwiftUI

struct GoalsView: View {
    
    @StateObject var viewModel = GoalsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("My Goals")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .padding(6)
                            .background(Circle().fill(Color("primary")))
                        
                    })
                }
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                if viewModel.goals.isEmpty {
                    
                    VStack {
                        
                        Image(systemName: "checkmark.square")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .padding(8)
                        
                        Text("No set goals")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("Click the button above to set a new goal for yourself")
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
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                VStack(alignment: .leading) {
                                    
                                    HStack {
                                        
                                        VStack {
                                            
                                            HStack {
                                                
                                                Image("flags")
                                                
                                                Text("EUR/USD")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .regular))
                                            }
                                            
                                            Text(index.goalName ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 18, weight: .semibold))
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .regular))
                                    }
                                    
                                    Text(index.goalDescription ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                    
                                    HStack {
                                        
                                        Text("+$\(index.goalMoney ?? "")")
                                            .foregroundColor(.green)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                    }
                                    .padding(.vertical, 5)
                                    
                                    HStack {
                                        
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color("primary"))
                                            .frame(width: 70, height: 5)
                                        
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color("primary"))
                                            .frame(width: 70, height: 5)
                                        
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.gray)
                                            .frame(width: 70, height: 5)
                                        
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.gray)
                                            .frame(width: 70, height: 5)
                                    }
                                    .frame(maxWidth: .infinity)
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color("primary"))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 3)
                                }
                            })
                            .padding(.bottom)
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchGoals()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            NewGoal(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {

            GoalInfo(viewModel: viewModel)
        })
    }
}

#Preview {
    GoalsView()
}
