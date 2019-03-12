//
//  ArticlesListProtocols.swift
//  PopularArticles
//
//  Created by Naresh Nallamsetty on 11/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingArticlesList()
    func showArticleDetailsController(navigationController:UINavigationController, selectedArticle: Results)

}

protocol PresenterToViewProtocol: class{
    func showArticlesList(articlesArray:Array<Results>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> ArticlesListViewController
    func pushToArticleDetailsScreen(navigationController:UINavigationController, selectedArticle: Results)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchArticlesList()
}

protocol InteractorToPresenterProtocol: class {
    func articlesListFetchedSuccess(articlesListModelArray:Array<Results>)
    func articlesListFetchFailed()
}
