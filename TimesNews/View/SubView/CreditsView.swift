//
//  CreditsView.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - BODY

    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.orange)
                .scaledToFit()
                .frame(width: 300, height: 50)

            Text("""
            Copyright © Narek Aslanyan
            All Rights reserved
            Better Apps ♡ Less Code
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
        .opacity(0.8)
    }
}

// MARK: - PREVIEW

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
