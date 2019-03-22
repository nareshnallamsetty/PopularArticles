//
//  ArticlesListRouterTests.swift
//  PopularArticlesTests
//
//  Created by Naresh Nallamsetty on 22/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

@testable import PopularArticles
import XCTest

class ArticlesListRouterTests: XCTestCase {
    
    var sut: ArticlesListRouter!
    var navigationController: UINavigationController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        setupArticlesListRouter()
        let viewController = ArticlesListViewController.getInstance()
        navigationController = UINavigationController(rootViewController: viewController)
        UIApplication.shared.keyWindow?.rootViewController = navigationController
    }
    
    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func setupArticlesListRouter() {
        sut = ArticlesListRouter()
    }
    
    func testPushToArticleDetailsScreen() {
        if let articlesList = self.readJson(fileName: "articles") {
            sut.pushToArticleDetailsScreen(navigationController: navigationController, selectedArticle: articlesList[0])
            let articleDetailsModule = ArticleDetailsRouter.createModule()
            articleDetailsModule.articleDetails = articlesList[0]
            navigationController.viewControllers.append(articleDetailsModule)
            XCTAssertTrue(navigationController.viewControllers.last is ArticleDetailsViewController)
        }
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
