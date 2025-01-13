//
//  ContentView.swift
//  Weather
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                MainHeaderView(viewModel: viewModel)
                TodayWeatherView(viewModel: viewModel)
            }
            .padding(.vertical, 20)
            .navigationBarTitle("Weather")
            .background(Gradient(colors: [.teal, .red, .orange]).opacity(0.6))
        }
        
    }
    
}
