//
//  Action.swift
//  ReSwiftDemo
//
//  Created by Talor Levy on 4/19/23.
//

import ReSwift

enum AppAction: Action {
    case fetchWeatherFor(weather: Result<WeatherResponseModel>)
    case getUserLocation(latitude: Double, longitude: Double)
}
