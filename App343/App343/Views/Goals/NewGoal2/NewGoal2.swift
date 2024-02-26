//
//  NewGoal2.swift
//  App343
//
//  Created by DJUNA on 23/02/2024.
//

import SwiftUI

struct NewGoal2: View {
    
    @Environment(\.presentationMode) var back
    @State var isReady: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(.gray.opacity(0.3))
                    .frame(width: 30, height: 4)
                    .padding(5)
                
                Text("New goal")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Image("flags")
                        
                        Text("EUR/USD")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                        
                        Spacer()
                    }
                    
                    Image("chart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                Button(action: {
                    
                    back.wrappedValue.dismiss()

                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    NewGoal2()
}
