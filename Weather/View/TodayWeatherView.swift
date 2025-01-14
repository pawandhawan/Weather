//
//  TodayWeatherView.swift
//  Weather
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import SwiftUI

struct TodayWeatherView: View {
    @ObservedObject var viewModel = WeatherViewModel()

    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            if let currentModel = self.viewModel.weather?.current,
               let locationModel = self.viewModel.weather?.location {
                Text("\(locationModel.name ?? "")").font(.largeTitle).fontWeight(.bold)
                Text("\(currentModel.condition?.text ?? "")").font(.subheadline).fontWeight(.medium)
                Text("\(currentModel.temp_c ?? 0, specifier: "%.1f") °C").font(.title).fontWeight(.bold)
                Text("\(WeatherForecast.feelsLikeText)  \(currentModel.feelslike_c ?? 0, specifier: "%.1f") °C").font(.headline).fontWeight(.medium)
                Text("\(WeatherForecast.humidityText)  \(currentModel.humidity ?? 0)").font(.headline).fontWeight(.medium)
                Text("\(WeatherForecast.windSpeedText)  \(currentModel.wind_kph ?? 0, specifier: "%.1f")").font(.headline).fontWeight(.medium)
                
                Spacer()
                
                Button(action: {}, label: {
                    NavigationLink(WeatherForecast.forecastLinkTitle) {
                        ForecastView(viewModel: viewModel)
                    }
                })
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                .background(Color(red: 0.0, green: 0.5, blue: 0.5))
                .foregroundStyle(.white)
                .clipShape(Capsule())
                
                Spacer()
                
            } else if self.viewModel.error != nil {
                ErrorView(viewModel: viewModel)
            }
        }
    }
}
