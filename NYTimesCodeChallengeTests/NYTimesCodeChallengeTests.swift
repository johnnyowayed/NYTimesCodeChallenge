//
//  NYTimesCodeChallengeTests.swift
//  NYTimesCodeChallengeTests
//
//  Created by Johnny Owayed on 11/20/20.
//

import XCTest
import Alamofire
@testable import NYTimesCodeChallenge

class NYTimesCodeChallengeTests: XCTestCase {
    
    func test_fetchingNewsArticles() {
        let ex = expectation(description: "Alamofire")
        let path = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=Rk6GfVjL9XA3A5ipo7bjr2fNh80CpeA5"
        
        AF.request(path, method: .get, encoding: JSONEncoding.default).responseJSON { (response) in
            XCTAssertNil(response.error, "Whoops, error \(response.error!.localizedDescription)")
            XCTAssertNotNil(response, "No response")
            XCTAssertEqual(response.response?.statusCode ?? 0, 200, "Status code not 200")
            ex.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
