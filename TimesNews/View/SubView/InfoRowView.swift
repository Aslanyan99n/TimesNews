//
//  InfoRowView.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import SwiftUI

struct InfoRowView: View {
    // MARK: - PROPERTIES

    var title: String
    var subTitle: String

    // MARK: - BODY

    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 2)
                .frame(height: 1)
                .background(Color.blue)

            HStack(alignment: .top) {
                Group {
                    Image(systemName: "info.circle")
                    Text(title)
                }
                .foregroundColor(.blue)
                .font(.system(.body))

                Spacer()
                Text(subTitle)
                    .multilineTextAlignment(.trailing)
            } //: HSTACK
        } //: VSTACK
    }
}

// MARK: - PREVIEW

struct InfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        InfoRowView(title: "Title", subTitle: "SubTitle")
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
