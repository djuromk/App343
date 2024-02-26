//
//  ROB2.swift
//  App343
//
//  Created by DJUNA on 22/02/2024.
//

import SwiftUI

struct ROB2: View {
    
    @AppStorage("status") var status: Bool = false
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Revi2")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Create your own goals")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                        .padding(9)
                        .padding(.top)
                    
                    Text("Create goals and track your progress by completing your assignments")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack {

                        Circle()
                            .fill(Color.gray)
                            .frame(width: 6)
                        
                        Circle()
                            .fill(Color("primary"))
                            .frame(width: 6)
                        
                    }
                    
                    Button(action: {
                        
                        status = true
                        
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
    ROB2()
}
