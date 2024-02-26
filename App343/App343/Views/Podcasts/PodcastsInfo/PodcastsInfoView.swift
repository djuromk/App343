//
//  PodcastsInfoView.swift
//  App343
//
//  Created by DJUNA on 24/02/2024.
//

import SwiftUI

struct PodcastsInfoView: View {
    
    @StateObject var viewModel = PodcastsInfoModel()
    @StateObject var mainModel = MotivationViewModel()
    
    @Environment(\.presentationMode) var back
    let selectedPodcast: Podcasts
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            back.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                        })
                        
                        Spacer()
                        
                    }
                    
                    Text(selectedPodcast.title ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .padding(.horizontal)
                }
                .padding()
                
                    WebPicture(urlString: selectedPodcast.image ?? "", width: .infinity, height: 200, cornerRadius: 0)
                        .padding(.bottom)
                        .overlay(
                        
                            VStack {
                                
                                HStack{
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        mainModel.favoritesManager(selectedPodcast)
                                        
                                    }, label: {
                                        
                                        Image(systemName: mainModel.isFavorited(selectedPodcast) ? "star.fill" : "star")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .regular))
                                            .padding(8)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                                            .padding()
                                    })
                                }
                                Spacer()
                            }
                        )

                VStack {
                    
                    Text(selectedPodcast.title ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Text("Duration: \(selectedPodcast.duration ?? 0) min.")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                }
                
                VStack(spacing: 22) {
                    
                    GeometryReader { geometry in
                        
                        ZStack(alignment: .leading, content: {
                            
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.gray.opacity(0.15))
                                .frame(width: geometry.size.width, height: 5)
                            
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("primary"))
                                .frame(width: geometry.size.width * viewModel.progressWidth, height: 5)
                            
                            Circle()
                                .fill(.gray.opacity(0.2))
                                .frame(width: 12, height: 12)
                                .overlay (
                                    
                                    Circle()
                                        .fill(.black)
                                        .frame(width: 10, height: 10)
                                )
                                .position(x: geometry.size.width * viewModel.progressWidth, y: 18)
                                .frame(width: 35, height: 35)
                                .gesture(
                                    
                                    DragGesture(minimumDistance: 0)
                                        .onChanged { value in
                                            
                                            viewModel.progressWidth = min(max(0, value.location.x / geometry.size.width), 1)
                                            let newTime = Double(viewModel.progressWidth) * self.viewModel.duration
                                            
                                            viewModel.setCurrentTime(time: newTime)
                                            viewModel.isDragging = true
                                        }
                                        .onEnded { _ in
                                            
                                            guard let player = viewModel.player else { return }
                                            
                                            viewModel.isDragging = false
                                            player.play()
                                        }
                                )
                                .onReceive(viewModel.$currentTime) { currentTime in
                                    
                                    guard !viewModel.isDragging else { return }
                                    
                                    let progress = currentTime / viewModel.duration
                                    let clampedProgress = min(max(0, progress), 1)
                                    
                                    viewModel.progressWidth = CGFloat(clampedProgress)
                                }
                        })
                    }
                    .frame(height: 7)
                    
                    HStack {
                        
                        Text("\(formatTime(time: viewModel.currentTime))")
                            .foregroundColor(.gray)
                            .font(.system(size: 11, weight: .regular))
                        
                        Spacer()
                        
                        Text("\(formatTime(time: viewModel.duration))")
                            .foregroundColor(.gray)
                            .font(.system(size: 11, weight: .regular))
                    }
                }
                .padding()
                
                HStack(spacing: 50) {
                    
                    Button(action: {
                        
                        viewModel.rewind15Sec()
                        
                    }, label: {
                        
                        Image(systemName: "gobackward.15")
                            .foregroundColor(.black)
                            .font(.system(size: 21, weight: .regular))
                    })
                    
                    Button(action: {
                        
                        viewModel.playPause()
                        
                    }, label: {
                        
                        Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 30, weight: .regular))
                    })
                    
                    Button(action: {
                        
                        viewModel.forward15Sec()
                        
                    }, label: {
                        
                        Image(systemName: "goforward.15")
                            .foregroundColor(.black)
                            .font(.system(size: 21, weight: .regular))
                    })
                }
                .padding()
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .ignoresSafeArea()
        .onAppear {
            
            viewModel.setupPlayer(podcasts: selectedPodcast)
        }
    }
}


struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastsInfoView(selectedPodcast: Podcasts(id: 1, title: "evr", image: "https://quixoz.space/storage/image/Qq4fSe4AhudBSqesLepairD2Y69c0X1Z6Mlqk5he.jpg", audio: "https://quixoz.space/storage/audio/pLnmt6VlZTJwrbOoQlFQ6mtCbzIdgnWpVlQZST2B.mp3", duration: 10))
    }
}
