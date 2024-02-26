//
//  UOB1.swift
//  App343
//
//  Created by DJUNA on 22/02/2024.
//

import SwiftUI

struct UOB1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("ob1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Your Trading view")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                        .padding(9)
                        .padding(.top)
                    
                    Text("Achieve goals to be more successful")
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
                        
                        UOB2(telegram: telegram, isTelegram: isTelegram)
                            .navigationBarBackButtonHidden()
                        
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
    }
}

#Preview {
    UOB1(telegram: URL(string: "h")!, isTelegram: false)
}
