//
//  Store.swift
//  ReSwiftDemo
//
//  Created by Talor Levy on 4/19/23.
//

import ReSwift
import ReSwiftThunk

// Redux Store is configured with Thunk-Middleware to use it:
let thunkMiddleware: Middleware<AppState> = createThunkMiddleware()

// Global Store:
let appStore = Store<AppState>(reducer: appReducer,
                               state: AppState(),
                               middleware: [thunkMiddleware])
