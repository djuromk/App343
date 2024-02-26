//
//  LoadingView.swift
//  App343
//
//  Created by DJUNA on 22/02/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 150, height: 150)
                 
                    VStack {
                        
                        Spacer()
                        
                        ProgressView()
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
