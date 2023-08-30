//
//  ArticleGridItemView.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import SwiftUI

struct ArticleGridItemView: View {
    // MARK: - Properties

    let article: Article

    // MARK: - BODY

    var body: some View {
        URLImageView(urlString: article.urlString)
            .scaledToFit()
            .cornerRadius(12)
    }
}

// MARK: - PREVIEW

struct ArticleGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleGridItemView(article: articleMockData)
    }
}
