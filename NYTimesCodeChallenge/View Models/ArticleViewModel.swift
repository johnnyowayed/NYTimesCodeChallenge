//
//  ArticleViewModel.swift
//  NYTimesCodeChallenge
//
//  Created by Johnny Owayed on 11/20/20.
//

import Foundation

struct ArticleListViewModel {
    let articles: [ArticleModel]
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article: ArticleModel
    
    init(_ article: ArticleModel) {
        self.article = article
    }
    
    var title: String {
        return self.article.title
    }
    
    var subtitle: String {
        return self.article.byline
    }
    
    var date: String {
        return self.article.published_date
    }
}
