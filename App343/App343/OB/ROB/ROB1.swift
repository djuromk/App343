//
//  ROB1.swift
//  App343
//
//  Created by DJUNA on 22/02/2024.
//

import SwiftUI

struct ROB1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Revi1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Listen and get motivated every day")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                        .padding(9)
                        .padding(.top)
                    
                    Text("Podcasts and daily quotes from famous and successful people help you reach your goal")
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
                        
                        ROB2()
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
    ROB1()
}
