//
//  Article.swift
//  NewsApp
//
//  Created by ビジャイクマール デックシット ディッバダハッリ on 2023/02/24.
//

import Foundation

struct Article: Codable{
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}


struct Source: Codable{
//    let id: String
    let name: String
}


