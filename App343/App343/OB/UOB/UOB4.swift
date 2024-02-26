//
//  UOB4.swift
//  App343
//
//  Created by DJUNA on 22/02/2024.
//

import SwiftUI
import OneSignalFramework

struct UOB4: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("ob4")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Don't miss anything important")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                        .padding(9)
                        .padding(.top)
                    
                    Text("The most up-to-date information especially for you")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Skip")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                    })
                    
                    Button(action: {
                        
                        OneSignal.Notifications.requestPermission({ accepted in
                          print("User accepted notifications: \(accepted)")
                            status = true
                        }, fallbackToSettings: true)
                        
                    }, label: {
                        
                        Text("Enable Notifications")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color("primary")))
                            .padding()
                    })
                    .padding(.bottom, 30)

                }
            }
        }
    }
}

#Preview {
    UOB4()
}
