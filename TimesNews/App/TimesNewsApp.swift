//
//  TimesNewsApp.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import SwiftUI

@main
struct TimesNewsApp: App {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            MainView(request: NetworkRequest(), mainViewModel: MainViewModel())
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
