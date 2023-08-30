//
//  RequestModel.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import Foundation

struct RequestModel: Codable {
    let articles: [Article]

    init(articles: [Article]) {
        self.articles = articles
    }

    enum CodingKeys: String, CodingKey {
        case articles = "results"
    }
}
