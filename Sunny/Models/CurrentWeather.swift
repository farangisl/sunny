//
//  CurrentWeather.swift
//  Sunny
//
//  Created by Махмадёрова Фарангис Шухратовна on 25.01.2023.
//  Copyright © 2023 Ivan Akulov. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    let temperature: Double
    var temperatureString: String {
//        return "\(temperature.rounded())"
//        return String(format: "%.0f", temperature)
        return String(Int(temperature))
    }
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
//        return "\(feelsLikeTemperature.rounded())"
//        return String(format: "%.0f", feelsLikeTemperature)
        return String(Int(feelsLikeTemperature))
    }
    
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.max.fill"
        case 801...804: return "cloud.fill"
        default:
            return "nosign"
        }
    }
     
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}


