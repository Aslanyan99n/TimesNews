//
//  Article.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import Foundation

struct Article: Codable, Identifiable, Hashable {
    struct Media: Codable {
        struct MediaData: Codable {
            var url: String
        }

        var mediaData: [MediaData]

        enum CodingKeys: String, CodingKey {
            case mediaData = "media-metadata"
        }
    }

    var id: Int
    var url: String
    var title: String
    var subTitle: String
    var author: String
    var section: String
    var media: [Media]
    var publishedDate: String

    init(id: Int, url: String, title: String, subTitle: String, author: String, section: String, media: [Media], publishedDate: String) {
        self.id = id
        self.url = url
        self.title = title
        self.subTitle = subTitle
        self.author = author
        self.section = section
        self.media = media
        self.publishedDate = publishedDate
    }

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case title
        case subTitle = "abstract"
        case author = "byline"
        case section
        case media
        case publishedDate = "published_date"
    }

    var urlString: String {
        guard let arrayOfMediaData = media.first?.mediaData,
              arrayOfMediaData.count > 2 else { return "" }

        let mediaData = arrayOfMediaData[2]
        let url = mediaData.url
        return url
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.id == rhs.id
    }
}
