//
//  ArticleDetailsViewControllerTests.swift
//  PopularArticlesTests
//
//  Created by Naresh Nallamsetty on 22/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

@testable import PopularArticles
import XCTest

class ArticleDetailsViewControllerTests: XCTestCase {
    var sut: ArticleDetailsViewController!
    var window: UIWindow!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        window = UIWindow()
        let storyboard = UIStoryboard(name: MAIN_STORYBOARD_NAME, bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as? ArticleDetailsViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        window = nil
        sut = nil
        super.tearDown()
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Base tests
    func testThatArticleDetailsViewControllerExists() {
        XCTAssertNotNil(sut, "A ArticlesListViewController instance should be creatable from storyboard")
    }
    
    // MARK: viewDidLoad tests
    func testThatAfterViewDidLoadControlsPresent() {
        if let articlesList = self.readJson(fileName: "articles"), !articlesList.isEmpty {
            sut.articleDetails = articlesList[0]
        }
        self.loadView()
        XCTAssertNotNil(sut.articleImageView, "Article Image View instance should be present")
        XCTAssertNotNil(sut.titleLabel, "Article Title Label instance should be present")
        XCTAssertNotNil(sut.bylineLabel, "Article Byline Label instance should be present")
        XCTAssertNotNil(sut.publishedDateLabel, "Published Date Label View instance should be present")
        XCTAssertNotNil(sut.abstractLabel, "Article Abstract Label instance should be present")
    }
    
    func readJson(fileName: String?) -> [Results]? {
        guard let jsonfileName = fileName, let  fileUrl = Bundle.main.url(forResource: jsonfileName, withExtension: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: fileUrl)
            let articlesListResponse = try JSONDecoder().decode(ArticlesListModel.self, from: data)
            if let articlesData = articlesListResponse.results {
                return articlesData
            }
            return nil
        } catch {
            print("Error: \(error)")
        }
        return nil
    }
}
