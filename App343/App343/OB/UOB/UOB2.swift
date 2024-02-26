//
//  UOB2.swift
//  App343
//
//  Created by DJUNA on 22/02/2024.
//

import SwiftUI
import StoreKit

struct UOB2: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("ob2")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Rate our app")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                        .padding(9)
                        .padding(.top)
                    
                    Text("Leave your opinion about our App")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack {
                        
                        Circle()
                            .fill(Color("primary"))
                            .frame(width: 6)
                        
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 6)
                    }
                    
                    NavigationLink(destination: {
                        
                        if isTelegram == true {
                            
                            UOB3(telegram: telegram)
                                .navigationBarBackButtonHidden()
                            
                        } else if isTelegram == false {
                            
                            UOB4()
                                .navigationBarBackButtonHidden()
                        }
                        
                    }, label: {
                        
                        Text("Next")
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    UOB2(telegram: URL(string: "h")!, isTelegram: false)
}
