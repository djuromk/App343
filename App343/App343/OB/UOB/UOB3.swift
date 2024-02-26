//
//  UOB3.swift
//  App343
//
//  Created by DJUNA on 22/02/2024.
//

import SwiftUI

struct UOB3: View {
    
    let telegram: URL
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("ob3")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Join our Telegram Channel")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                        .padding(9)
                        .padding(.top)
                    
                    Text("and trade with our team")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        UOB4()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Skip")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                    })
                    
                    Button(action: {
                        
                        UIApplication.shared.open(telegram)
                        
                    }, label: {
                        
                        Text("Join")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color("tg")))
                            .padding()
                    })
                    .padding(.bottom, 30)

                }
            }
        }
    }
}

#Preview {
    UOB3(telegram: URL(string: "h")!)
}
