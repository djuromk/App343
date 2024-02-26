//
//  SettingsView.swift
//  App343
//
//  Created by DJUNA on 23/02/2024.
//

import SwiftUI
import CoreData
import StoreKit

struct SettingsView: View {
    
    @State var isReset: Bool = false
    @AppStorage("listened") var listened: Int = 0
    
    @AppStorage("savedPodcasts") var savedPodcasts: [String] = []
    @AppStorage("goalsAch") var goalsAch: Int = 0
    @AppStorage("Income") var Income: Int = 0
    @AppStorage("Upcome") var Upcome: Int = 0
    
    var body: some View {
        
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                }
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 30) {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("primary"))
                                
                                Text("Rate App")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 17, weight: .medium))
                            }
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: DataManager().usagePolicy) else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "bubble.fill")
                                    .foregroundColor(Color("primary"))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 17, weight: .medium))
                            }
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 16).stroke(.gray.opacity(0.4)))
                }
            }
            .padding()
        }
        .overlay (
            
            ZStack {
                
                Color.black.opacity(isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Reset data?")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                        .padding()
                    
                    Text("All your data will be cleared. You can log in again.")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                                                
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        listened = 0
                        goalsAch = 0
                        Income = 0
                        Upcome = 0
                        savedPodcasts.removeAll()
                        
                        CoreDataStack.shared.deleteAllData()
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                        
                    }, label: {
                        
                        Text("Reset")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
                .padding()
                .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
