//
//  TabBar.swift
//  WeatherApp
//
//  Created by Aditya Singh on 07/08/24.
//

import SwiftUI

struct TabBar: View {
    var action: () -> Void
    
    var body: some View {
        ZStack{
            // MARK: Arc Shape
            
            Arc()
                .fill(Color.tabBarBackground)
                .frame(height: 88)
                .overlay{
                    // MARK: Arc Border
                    Arc()
                        .stroke(Color.tabBarBorder,lineWidth: 0.5)
                }
            
            // MARK: Tab item
            HStack{
                
                // MARK: Expanded Button
                Button {
                   action()
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44,height: 44)
                }
                
                Spacer()
                
                // MARK: Navigation Button
                NavigationLink{
                    WeatherView()
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44,height: 44)
                }

            }
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top:20,leading: 32,bottom: 24,trailing: 32))
        }
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .bottom)
        .ignoresSafeArea()
        
    }
}

#Preview {
    TabBar(action: {})
        .preferredColorScheme(.dark)
}
