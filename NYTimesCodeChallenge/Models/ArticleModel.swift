//
//  ArticleModel.swift
//  NYTimesCodeChallenge
//
//  Created by Johnny Owayed on 11/20/20.
//

import Foundation

struct ArticleList: Decodable {
    let results: [ArticleModel]
}

struct ArticleModel: Decodable {
    let title: String
    let byline: String
    let published_date: String
    let abstract:String
}
