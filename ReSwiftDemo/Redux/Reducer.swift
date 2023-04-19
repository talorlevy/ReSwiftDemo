//
//  Reducer.swift
//  ReSwiftDemo
//
//  Created by Talor Levy on 4/19/23.
//

import ReSwift

// Reducer is responsible for State Change:

func appReducer(action: Action, state: AppState?) -> AppState {
    
    var state = state ?? AppState()
    
    guard let action = action as? AppAction else {
        return state
    }
    
    switch action {
    case .fetchWeatherFor(let weather):
        state.weatherData = weather
    case .getUserLocation(let lat, let long):
        state.latitude = lat
        state.longitude = long
    }
    
    return state
}
