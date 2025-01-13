//
//  ForecastRowView.swift
//  Weather
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import SwiftUI

struct ForecastRowView: View {
    var day: Forecastday
    
    var body: some View {
        HStack(spacing: 20) {
            Text(Utility().convertDateFormat(dateString: day.date ?? "") ?? "")
            Spacer()
            Text("\(day.day?.maxtemp_c ?? 0, specifier: "%.1f") °C / \(day.day?.mintemp_c ?? 0, specifier: "%.1f") °C")
        }
        .listRowBackground(Color.clear)
    }
}
