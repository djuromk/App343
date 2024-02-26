//
//  GoalInfo.swift
//  App343
//
//  Created by DJUNA on 23/02/2024.
//

import SwiftUI

struct GoalInfo: View {
    
    @StateObject var viewModel: GoalsViewModel
    @Environment(\.presentationMode) var router
    @State var isReady: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("My goals")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                 
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
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
                    .padding()
                    
                    VStack {
                        
                        HStack {
                            
                            VStack {
                                
                                HStack {
                                    
                                    Image("flags")
                                    
                                    Text("EUR/USD")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                }
                                
                                Text(viewModel.selectedGoal?.goalName ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            
                            Spacer()

                        }
                        
                        Text(viewModel.selectedGoal?.goalDescription ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        
                        HStack {
                            
                            Text("+$\(viewModel.selectedGoal?.goalMoney ?? "")")
                                .foregroundColor(.green)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Text("Task 0/1")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        }
                        .padding(.vertical, 5)
                    }
                    
                    Rectangle()
                        .fill(.gray.opacity(0.3))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical)
                    
                    HStack {
                        
                        Text(viewModel.selectedGoal?.goalTask ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                        Text("$\(viewModel.selectedGoal?.goalMoney ?? "")")
                            .foregroundColor(.green)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            isReady.toggle()
                            
                        }, label: {
                            
                            Image(systemName: isReady ? "checkmark.square" : "square")
                                .foregroundColor(.black)
                                .font(.system(size: 12, weight: .regular))
                        })
                    }
                }
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()

                }, label: {
                    
                    Text("Goal is complited")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    GoalInfo(viewModel: GoalsViewModel())
}
