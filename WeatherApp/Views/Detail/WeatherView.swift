//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Aditya Singh on 07/08/24.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText = ""
    
    var searchResults: [Forecast]{
        if searchText.isEmpty {
            return Forecast.cities
        } else{
            return Forecast.cities.filter{
                $0.location.contains(searchText)
            }
        }
    }
    
    var body: some View {
        ZStack{
            //MARK: Background
            Color.background
                .ignoresSafeArea()
            
            //MARK: Weather Widget
            ScrollView(showsIndicators:false){
                VStack(spacing: 20, content: {
                    ForEach(searchResults){
                        forecast in WeatherWidget(forecast: forecast)
                    }
                })
            }
            .safeAreaInset(edge: .top, content:{
                EmptyView()
                    .frame(height: 100)
            })
        }
        .overlay{
            //MARK: Navigation Bar
            NavigationBar(searchText: $searchText)
        }
        .navigationBarHidden(true)
//        .searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a city or airport")
    }
}

#Preview {
    NavigationView {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
