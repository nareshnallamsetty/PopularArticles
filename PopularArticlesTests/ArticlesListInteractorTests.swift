//
//  ArticlesListInteractorTests.swift
//  PopularArticlesTests
//
//  Created by Naresh Nallamsetty on 22/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

@testable import PopularArticles
import XCTest

class ArticlesListInteractorTests: XCTestCase {
    
    var sut: ArticlesListInteractor!
    var expectation: XCTestExpectation!
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        setupArticlesListInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
        expectation = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func setupArticlesListInteractor() {
        sut = ArticlesListInteractor()
    }
    
    
    func testArticlesListInteractor() {
        self.expectation = XCTestExpectation(description: "Fetch articles List")
        sut.fetchArticlesList(from: API_MOST_VIEWED_ARTICLES_LIST) { (results, err) in
            self.expectation.fulfill()
            XCTAssertEqual( results.count, 20)
            for result in results {
                XCTAssertNotNil(result.id)
            }
        }
        wait(for: [self.expectation], timeout: 5)
    }
    
}
