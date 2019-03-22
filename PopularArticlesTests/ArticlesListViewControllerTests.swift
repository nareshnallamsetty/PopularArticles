//
//  ArticlesListViewControllerTests.swift
//  PopularArticlesTests
//
//  Created by Naresh Nallamsetty on 22/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

@testable import PopularArticles
import XCTest

class ArticlesListViewControllerTests: XCTestCase {
    var sut: ArticlesListViewController!
    var window: UIWindow!
    var expectation: XCTestExpectation!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        window = UIWindow()
        sut = ArticlesListViewController.getInstance()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        window = nil
        expectation = nil
        sut = nil
        super.tearDown()
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Base tests
    func testThatArticlesListViewControllerExists() {
        XCTAssertNotNil(sut, "A ArticlesListViewController instance should be creatable from storyboard")
    }
    
    // MARK: viewDidLoad tests
    func testThatAfterViewDidLoadATableViewIsPresent() {
        loadView()
        XCTAssertNotNil(sut.articlesTableView, "a tableview instance should be present")
    }
    
    func testThatAfterViewDidLoadTableViewHasDelegate() {
        loadView()
        XCTAssertNotNil(sut.articlesTableView.delegate, "Tableview should have a delegate")
    }
    
    func testThatAfterViewDidLoadTableViewHasDataSource() {
        loadView()
        XCTAssertNotNil(sut.articlesTableView.dataSource, "Tableview should have a datasource")
    }
    
    func testShowArticlesList() {
        self.loadView()
        if let articlesList = self.readJson(fileName: "articles") {
            sut.showArticlesList(articlesArray: articlesList)
            XCTAssertNotNil(sut.articlesArrayList)
        }
    }
    
    func testShowError() {
        self.loadView()
        sut.showError()
        XCTAssertNotNil(sut.presentedViewController)
        XCTAssertTrue(sut.presentedViewController is UIAlertController, "Show Alert")
    }
    
    func testNumberofRowsInSectionsNoData() {
        self.loadView()
        let tableView = sut.articlesTableView!
        if let articlesList = self.readJson(fileName: "articles") {
            sut.articlesArrayList = articlesList
            let count = sut.tableView(tableView, numberOfRowsInSection: 0)
            XCTAssertEqual(articlesList.count, count)
        }
    }
    
    func testCellForRowAtIndexPath() {
        self.loadView()
        let tableView = sut.articlesTableView!
        if let articlesList = self.readJson(fileName: "articles") {
            sut.articlesArrayList = articlesList
            let indexPath = IndexPath(row: 0, section: 0)
            let articlesInfoCell = sut.tableView(tableView, cellForRowAt: indexPath) as? ArticlesCell
            XCTAssertNotNil(articlesInfoCell)
        }
    }
    
    func testDidSelectRowAtIndexPath() {
        self.loadView()
        let tableView = sut.articlesTableView!
        if let articlesList = self.readJson(fileName: "articles") {
            sut.articlesArrayList = articlesList
            let indexPath = IndexPath(row: 0, section: 0)
            sut.tableView(tableView, didSelectRowAt: indexPath)
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
