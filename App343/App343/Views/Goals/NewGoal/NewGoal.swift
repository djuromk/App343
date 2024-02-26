//
//  NewGoal.swift
//  App343
//
//  Created by DJUNA on 23/02/2024.
//

import SwiftUI

struct NewGoal: View {
    
    @StateObject var viewModel: GoalsViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var isReady: Bool = false
    @State var isNext: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(.gray.opacity(0.3))
                    .frame(width: 30, height: 4)
                    .padding(5)
                
                Text("New goal")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Text("Goal name")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                    }
                    .padding(.top)
                    .padding(.bottom, 6)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Name")
                            .foregroundColor(viewModel.goalName.isEmpty ? .gray : . black)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.goalName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.goalName)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    
                    Rectangle()
                        .fill(.gray.opacity(0.3))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.bottom)
                    
                    HStack {
                        
                        Text("Description of goal")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                    }
                    .padding(.top)
                    .padding(.bottom, 6)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Description")
                            .foregroundColor(viewModel.goalDescription.isEmpty ? .gray : . black)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.goalDescription.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.goalDescription)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    
                    Rectangle()
                        .fill(.gray.opacity(0.3))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.bottom)
                    
                    HStack {
                        
                        Text("Money goal")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                    }
                    .padding(.top)
                    .padding(.bottom, 6)
                    
                    ZStack(alignment: .leading, content: {
                        
                        HStack {
                            
                            Text("$100")
                                .foregroundColor(viewModel.goalMoney.isEmpty ? .gray : . black)
                                .font(.system(size: 15, weight: .medium))
                                .opacity(viewModel.goalMoney.isEmpty ? 1 : 0)
                            
                            Spacer()
                            
                            Image("flags")
                            
                        }
                        
                        TextField("", text: $viewModel.goalMoney)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                            .keyboardType(.decimalPad)
                    })
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    
                    Rectangle()
                        .fill(.gray.opacity(0.3))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.bottom)
                    
                    Text("Write subgoals to achieve your main goal")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.top)
                        .padding(.bottom, 6)
                    
                    HStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Write a task...")
                                .foregroundColor(viewModel.goalTask.isEmpty ? .gray : . black)
                                .font(.system(size: 15, weight: .medium))
                                .opacity(viewModel.goalTask.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.goalTask)
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                        })
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        ZStack(alignment: .trailing, content: {
                            
                            Text("+100$")
                                .foregroundColor(viewModel.goalTMoney.isEmpty ? .gray : . black)
                                .font(.system(size: 15, weight: .medium))
                                .opacity(viewModel.goalTMoney.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.goalTMoney)
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                        })
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        
                        Button(action: {
                            
                            isReady.toggle()
                            
                        }, label: {
                            
                            Image(systemName: isReady ? "checkmark.square" : "square")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                        })
    
                    }
                    
                }

                Button(action: {
                    
                    viewModel.goalsAch += 1
                    viewModel.Income += Int(viewModel.goalMoney) ?? 0
                    viewModel.Upcome += Int(viewModel.goalMoney) ?? 0
                    viewModel.Upcome += Int(viewModel.goalTMoney) ?? 0

                    viewModel.addGoal(completion: {
                        
                        viewModel.goalName = ""
                        viewModel.goalDescription = ""
                        viewModel.goalMoney = ""
                        viewModel.goalTask = ""
                        viewModel.goalTMoney = ""
                    })
                    
                    viewModel.fetchGoals()
                    
                    withAnimation(.spring()) {
                        
                        isNext = true
                    }

                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                })
                .opacity(viewModel.goalName.isEmpty || viewModel.goalDescription.isEmpty || viewModel.goalMoney.isEmpty ? 0.5 : 1)
                .disabled(viewModel.goalName.isEmpty || viewModel.goalDescription.isEmpty || viewModel.goalMoney.isEmpty ? true : false)
            }
            .padding()
        }
        .sheet(isPresented: $isNext, content: {
            
            NewGoal2()
        })
    }
}

#Preview {
    NewGoal(viewModel: GoalsViewModel())
}
