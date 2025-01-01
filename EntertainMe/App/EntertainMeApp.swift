//
//  EntertainMeApp.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/23/24.
//

import SwiftUI

@main
struct EntertainMeApp: App {
    @State private var showingSplash = true
    
    var body: some Scene {
        WindowGroup {
            if showingSplash {
                EMSplashView(showingSplash: $showingSplash)
            } else {
                RootTabView()
            }
        }
    }
}
