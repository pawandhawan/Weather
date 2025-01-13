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
                
                NavigationLink(WeatherForecast.forecastLinkTitle) {
                    ForecastView(viewModel: viewModel)
                }
                Spacer()
            } else if let error = self.viewModel.error {
                ErrorView(viewModel: viewModel)
            }
        }
    }
}
