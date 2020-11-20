//
//  NYTimesCodeChallengeUITests.swift
//  NYTimesCodeChallengeUITests
//
//  Created by Johnny Owayed on 11/20/20.
//

import XCTest
@testable import NYTimesCodeChallenge

class NYTimesCodeChallengeUITests: XCTestCase {
    
    func test_CellActions() {
        let app = XCUIApplication()
        app.launch()
        app.tables["tableView"].cells["cell: 2"].tap()
        app.navigationBars["NY Times Most Popular"].buttons["NY Times Most Popular"].tap()
    }
}
