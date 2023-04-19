//
//  Thunks.swift
//  ReSwiftDemo
//
//  Created by Talor Levy on 4/19/23.
//

import Foundation
import ReSwift
import ReSwiftThunk

let fetchWeatherThunk = Thunk<AppState> { dispatch, getState in
    if let state = getState(),
       let lat = state.latitude,
       let long = state.longitude {
        
        NetworkManager().fetchWeatherData(latitude: lat, longitude: long) { weather in
            DispatchQueue.main.async {
                dispatch(AppAction.fetchWeatherFor(weather: weather))
            }
        }
        
    } else {
        return
    }
}

let getUserLocationThunk = Thunk<AppState> { dispatch, getState in
    // implement Location Manager async logic here:
    
    DispatchQueue.main.async {
        dispatch(AppAction.getUserLocation(latitude: 28.5355, longitude: 77.3910))
    }
}
