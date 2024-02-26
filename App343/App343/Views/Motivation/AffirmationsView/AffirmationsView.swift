//
//  AffirmationsView.swift
//  App343
//
//  Created by DJUNA on 24/02/2024.
//

import SwiftUI

struct AffirmationsView: View {
    
    @StateObject var viewModel: MotivationViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Affirmations")
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
                
                if viewModel.isSavedAffir == false {
                    
                    VStack {
                        
                        Image(systemName: "bookmark.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .padding(8)
                        
                        Text("No saved affirmations")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("Add a new affirmation to your favorites at the beginning of each day to come back to it")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: 300)
                            .multilineTextAlignment(.center)
                            .padding(1)
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color("primary"))
                                .frame(maxHeight: .infinity)
                                .frame(width: 3)
                            
                            VStack {
                                
                                HStack {
                                    
                                    Text("Affirmation")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    Spacer()
                                    
                                }
                                .padding(.vertical, 25)
                                
                                Text("As a visionary leader, I am consistently cultivating a harmonious and inspiring work environment where creativity flows freely, collaboration thrives, and each team member's unique strengths are acknowledged, fostering a culture of empowerment that drives not only individual growth but also the collective success of my business.")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .multilineTextAlignment(.leading)
                            }
                            
                            VStack {
                                
                                Button(action: {
                                    
                                    viewModel.isAffirmation.toggle()
                                    
                                }, label: {
                                    
                                    Image(systemName: viewModel.isSavedAffir ? "bookmark.fill" : "bookmark")
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 14, weight: .regular))
                                })
                                
                                Spacer()
                                
                            }
                        }
                        .padding()
                    }
                    .background(RoundedRectangle(cornerRadius: 16).stroke(.gray.opacity(0.3)))
                }
            }
            }
            .padding()
        }
    }
}

#Preview {
    AffirmationsView(viewModel: MotivationViewModel())
}
