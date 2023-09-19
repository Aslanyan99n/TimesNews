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
        AsyncImage(url: URL(string: article.urlString)) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "photo")
                .renderingMode(.template)
                .resizable()
                .foregroundColor(.gray)
        }
        .cornerRadius(12)
    }
}

// MARK: - PREVIEW

struct ArticleGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleGridItemView(article: articleMockData)
    }
}
