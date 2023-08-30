//
//  ArticleRowView.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import SwiftUI

struct ArticleRowView: View {
    // MARK: - PROPERTIES

    var article: Article

    // MARK: - BODY

    var body: some View {
        HStack(spacing: 10) {
            URLImageView(urlString: article.urlString)
                .frame(width: 100, height: 100)
                .cornerRadius(12)

            VStack(alignment: .leading, spacing: 4) {
                // TITLE
                Text(article.title)
                    .font(.system(size: 16, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)

                // AUTHOR
                Text(article.author)
                    .font(.system(size: 12, weight: .light))
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .foregroundColor(.gray)

                // PUBLISHED DATE
                HStack {
                    Spacer()

                    Image(systemName: "calendar")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.gray)

                    Text(article.publishedDate)
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(.gray)
                } //: HSTACK
            } //: VSTACK
        } //: HSTACK
        .padding()
    }
}

// MARK: - PREVIEW

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(article: articleMockData)
            .previewLayout(.fixed(width: 300, height: 140))
    }
}
