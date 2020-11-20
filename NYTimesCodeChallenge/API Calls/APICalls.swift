//
//  APICalls.swift
//  NYTimesCodeChallenge
//
//  Created by Johnny Owayed on 11/20/20.
//

import Foundation
import UIKit
import Alamofire

class APICalls {
    
    // MARK: - Fetch News Articles
    class func fetchNewsArticles(successCallback: ((_ fetchResult:[ArticleModel]) -> ())? = nil, errorCallback: ((_ error:Error?) -> ())? = nil){
        
        let key = "Rk6GfVjL9XA3A5ipo7bjr2fNh80CpeA5"
        let section = "all-sections"
        let period = 7
        let path = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/\(section)/\(period).json?api-key=\(key)"
        
        AF.request(path, method: .get, encoding: JSONEncoding.default).validate(statusCode: 200..<300)
            .responseJSON { response in
                
                switch response.result {
                    case .success:
                        if let articleList = try? JSONDecoder().decode(ArticleList.self, from: response.data ?? Data()) {
                            if let successCallback = successCallback {
                                successCallback(articleList.results)
                            }
                        }
                    case .failure(let error):
                        if let errorCallback = errorCallback {
                            errorCallback(error)
                        }
                }
            }
    }
}
