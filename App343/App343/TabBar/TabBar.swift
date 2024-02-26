//
//  TabBar.swift
//  App343
//
//  Created by DJUNA on 15/02/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {

        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index

                }, label: {
                    
                    VStack(alignment: .center, spacing: 8) {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                            .font(.system(size: 11, weight: .regular))
                    }
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 26)
        .background(Color.white)
    }
}

enum Tab: String, CaseIterable {
    
    case Motivation = "Motivation"
    
    case Goals = "My Goals"
    
    case Podcasts = "Podcasts"

    case History = "My history"

    case Settings = "Settings"

    
}
