//
//  NewsArticleViewModel.swift
//  NewsApp
//
//  Created by ビジャイクマール デックシット ディッバダハッリ on 2023/02/24.
//

import Foundation

class NewsArticleViewModel{
    let title: String
    let description: String?
    let imageUrl: URL?
    var image: Data?
    
    init(title: String, description: String?, imageUrl: URL?){
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
    }
}
