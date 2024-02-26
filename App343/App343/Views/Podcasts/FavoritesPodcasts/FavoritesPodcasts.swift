//
//  FavoritesPodcasts.swift
//  App343
//
//  Created by DJUNA on 24/02/2024.
//

import SwiftUI

struct FavoritesPodcasts: View {
    
    @Environment(\.presentationMode) var router
    @StateObject var viewModel = MotivationViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Favorite")
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
                
                if viewModel.getFavoritePodcasts().isEmpty {
                    
                    VStack {
                        
                        VStack {
                            
                            Image("headphones")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(8)
                            
                            Text("No featured podcasts")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .semibold))
                            
                            Text("Add your first podcast to your favorites to keep it forever")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                                .padding(1)
                        }
                        .frame(maxHeight: .infinity)
                    }
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(viewModel.getFavoritePodcasts(), id: \.self) { index in
                        
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
            }
            .padding()
        }
        .onAppear {
            
            viewModel.getPodcasts()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            PodcastsInfoView(selectedPodcast: viewModel.selectedPodcast)
        })
    }
}

#Preview {
    FavoritesPodcasts()
}
