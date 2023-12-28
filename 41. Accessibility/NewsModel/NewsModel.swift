//
//  NewsModel.swift
//  41. Accessibility
//
//  Created by Sesili Tsikaridze on 27.12.23.
//

import Foundation

// MARK: - NewsData
struct NewsData: Decodable {
    let results: [News]
}

// MARK: - News
struct News: Decodable {
    let url: String
    let id: Int
    let source, publishedDate, section: String
    let byline, type, title: String
    let media: [Media]

    enum CodingKeys: String, CodingKey {
        case url, id
        case source
        case publishedDate = "published_date"
        case section
        case byline, type, title
        case media
    }
}

// MARK: - Media
struct Media: Decodable {
    let mediaMetadata: [MediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Decodable {
    let url: String
}

