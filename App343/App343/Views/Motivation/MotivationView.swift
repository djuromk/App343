//
//  MotivationView.swift
//  App343
//
//  Created by DJUNA on 23/02/2024.
//

import SwiftUI

struct MotivationView: View {
    
    @StateObject var viewModel = MotivationViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        
                        
                    })
                }
                
                HStack {
                    
                    Text("Motivation of the day")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                }
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                HStack {
                    
                    Text("Podcast of the day")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.vertical)
                    
                    Spacer()
                    
                }
                                    
                    ForEach(viewModel.podcasts.prefix(1), id: \.self) { index in
                    
                        HStack {
                            
                            Image("headphones")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(8)
                            
                            VStack {
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Text("\(index.duration ?? 0) min")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                
                                Text(index.title ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                                    .lineLimit(1)
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.gray.opacity(0.6))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 4)
                            }
                        }
                    }
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                HStack {
                    
                    Text("Affirmation of the day")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.vertical)
                    
                    Spacer()
                    
                }
                    
                    VStack {
                        
                        HStack {
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color("primary"))
                                .frame(maxHeight: .infinity)
                                .frame(width: 3)
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAffirmation = true
                                }
                                
                            }, label: {
                                
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
                        })
                            
                            VStack {
                                
                                Button(action: {
                                    
                                    viewModel.isSavedAffir.toggle()
                                    
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
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            
            viewModel.getPodcasts()
        }
        .sheet(isPresented: $viewModel.isAffirmation, content: {
            
            AffirmationsView(viewModel: viewModel)
        })
    }
}

#Preview {
    MotivationView()
}
