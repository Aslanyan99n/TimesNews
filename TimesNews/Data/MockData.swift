//
//  MockData.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import Foundation

var articleMockData = Article(
    id: 100000009056356,
    url: "https://www.nytimes.com/2023/08/25/business/land-purchases-solano-county.html",
    title: "The Silicon Valley Elite Who Want to Build a City From Scratch",
    subTitle: "A mysterious company has spent $800 million in an effort to buy thousands of acres of San Francisco Bay Area land. The people behind the deals are said to be a who’s who of the tech industry.",
    author: "By Conor Dougherty and Erin Griffith",
    section: "Business",
    media: [Article.Media(mediaData: [Article.Media.MediaData(url: "https://static01.nyt.com/images/2023/08/25/business/25Solano-Promo/25Solano-Promo-thumbStandard.jpg")])],
    publishedDate: "2023-08-25")
