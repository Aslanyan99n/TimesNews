//
//  DetailView.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES

    var article: Article

    // MARK: - BODY

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    // HEADER
                    ArticleHeaderView(article: article)

                    VStack(alignment: .leading, spacing: 20) {
                        // TITLE
                        Text(article.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .gradientForeground(colors: [.blue, .purple])

                        // HEADLINE
                        Text(article.subTitle)
                            .font(.headline)
                            .multilineTextAlignment(.leading)

                        // NUTRIENTS
                        ArticleInfoContainerView(article: article)

                        // SUBHEADLINE
                        Text("Learn more about \(article.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(.orange)

                        // LINK
                        SourceLinkView(article: article)
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                    } //: VSTACK
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                } //: VSTACK
                .navigationTitle(article.title)
                .navigationBarTitleDisplayMode(.inline)
            } //: SCROLL
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
        } //: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

// MARK: - PREVIEW

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(article: articleMockData)
    }
}
