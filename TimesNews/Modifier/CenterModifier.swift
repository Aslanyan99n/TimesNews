//
//  CenterModifier.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import Foundation
import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
