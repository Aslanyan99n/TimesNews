//
//  SourceLinkView.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import SwiftUI

struct SourceLinkView: View {
    // MARK: - PROPERTIES
    var article: Article

    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Text("Content Source")
                    .font(.system(size: 16, weight: .medium))

                Spacer()

                Link("NY Times", destination: URL(string: article.url)!)
                    .foregroundColor(.blue)
                    .font(.system(size: 16, weight: .medium))

                Image(systemName: "arrow.up.right.square")
                    .resizable()
                    .frame(width: 16, height: 16)
            } //: HSTACK
            .font(.footnote)
        } //: BOX
    }
}

// MARK: - PREVIEW

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView(article: articleMockData)
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
