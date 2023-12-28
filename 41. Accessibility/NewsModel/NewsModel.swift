//
//  NewsModel.swift
//  41. Accessibility
//
//  Created by Sesili Tsikaridze on 27.12.23.
//

import Foundation

// MARK: - ProductData
struct NewsData: Codable {
    let offset, number, available: Int
    let news: [News]
}

// MARK: - News
struct News: Codable {
    let id: Int
    let title, text: String
    let url: String
    let image: String
    let publishDate, author: String
    let authors: [String]
    let language, sourceCountry: String
    let sentiment: Double

    enum CodingKeys: String, CodingKey {
        case id, title, text, url, image
        case publishDate = "publish_date"
        case author, authors, language
        case sourceCountry = "source_country"
        case sentiment
    }
}
