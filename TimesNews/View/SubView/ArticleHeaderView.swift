//
//  ArticleHeaderView.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import SwiftUI

struct ArticleHeaderView: View {
    // MARK: - PROPERTIES

    var article: Article
    @State private var isAnimating: Bool = false

    // MARK: - BODY

    var body: some View {
        URLImageView(urlString: article.urlString)
            .scaledToFill()
            .scaleEffect(isAnimating ? 1 : 0)
            .background(
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .animation(.easeIn(duration: 1), value: isAnimating)
            .onAppear {
                isAnimating = true
            }
    }
}

// MARK: - PREVIEW

struct ArticleHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleHeaderView(article: articleMockData)
    }
}
