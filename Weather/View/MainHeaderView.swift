//
//  MainHeaderView.swift
//  Weather
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import SwiftUI

struct MainHeaderView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    @State private var city = ""

    var body: some View {
        HStack(spacing: 5){
            TextField("Enter city", text: $city)
                .textFieldStyle(.roundedBorder)
            Button("Search") {
                self.viewModel.checkWeatherCache(forCity: city)
            }
        }
        .padding(.horizontal, 20)
    }
}
