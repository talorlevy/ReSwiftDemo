//
//  State.swift
//  ReSwiftDemo
//
//  Created by Talor Levy on 4/19/23.
//

import ReSwift

// This is Main State of the application:
// For Complex States, Sub States can also be defined.

struct AppState {
    var latitude: Double?
    var longitude: Double?
    var weatherData: Result<WeatherResponseModel>?
}
