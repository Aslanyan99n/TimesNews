//
//  ArticleInfoContainerView.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import SwiftUI

struct ArticleInfoContainerView: View {
    // MARK: - PROPERTIES

    var article: Article

    // MARK: - BODY

    var body: some View {
        GroupBox {
            DisclosureGroup("Info about this article") {
                InfoRowView(title: "Section", subTitle: article.section)

                InfoRowView(title: "Published Date", subTitle: article.publishedDate)
            }
            .accentColor(.blue)
            .font(.system(size: 16, weight: .medium))
        } //: BOX

    }
}

// MARK: - PREVIEW

struct ArticleInfoContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleInfoContainerView(article: articleMockData)
    }
}
