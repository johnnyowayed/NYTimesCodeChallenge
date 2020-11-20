//
//  ArticleDetailViewModel.swift
//  NYTimesCodeChallenge
//
//  Created by Johnny Owayed on 11/20/20.
//

import Foundation

struct ArticleDetailViewModel {

    private let article: ArticleModel
    
    init(_ article: ArticleModel) {
        self.article = article
    }
    
    var title: String {
        return self.article.title
    }
    
    var abstract: String {
        return self.article.abstract
    }
}
