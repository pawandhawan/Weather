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
                .onChange(of: city) { newValue in
                    self.viewModel.autocomplete(city)
                }
            Button("Search") {
                self.viewModel.checkWeatherCache(forCity: city)
            }
        }
        .padding(.horizontal, 10)
                
        List(self.viewModel.suggestions, id: \.self) { suggestion in
            ZStack {
                Text(suggestion)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .onTapGesture {
                city = suggestion
                self.viewModel.autocomplete("")
                self.viewModel.checkWeatherCache(forCity: city)
                UIApplication
                    .shared
                    .connectedScenes
                    .compactMap { ($0 as? UIWindowScene)?.keyWindow }
                    .last?.endEditing(true)
            }
        }
    }
}
