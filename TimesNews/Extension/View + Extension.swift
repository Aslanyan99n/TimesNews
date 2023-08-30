//
//  View + Extension.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import Foundation
import SwiftUI

extension View {
    func gradientForeground(colors: [Color]) -> some View {
        self.overlay(
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .mask(self)
    }
}
