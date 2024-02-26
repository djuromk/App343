//
//  PodcastsView.swift
//  App343
//
//  Created by DJUNA on 23/02/2024.
//

import SwiftUI

struct PodcastsView: View {
    
    @StateObject var viewModel = MotivationViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isFavorites = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    })
                }
                
                HStack {
                    
                    Text("Podcasts")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                }
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(viewModel.podcasts, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.selectedPodcast = index
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDetail = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                WebPicture(urlString: index.image ?? "", width: 90, height: 90, cornerRadius: 10)
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Text("\(index.duration ?? 0) min")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                            .padding(.vertical, 7)
                                        
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
                                .padding(.horizontal, 6)
                            }
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16).stroke(.gray.opacity(0.4)))
                        .padding(1)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.getPodcasts()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            PodcastsInfoView(selectedPodcast: viewModel.selectedPodcast)
        })
        .sheet(isPresented: $viewModel.isFavorites, content: {
            
            FavoritesPodcasts()
        })
    }
}

#Preview {
    PodcastsView()
}
