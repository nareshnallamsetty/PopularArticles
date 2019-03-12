//
//  ArticlesListPresenter.swift
//  PopularArticles
//
//  Created by Naresh Nallamsetty on 11/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

import Foundation
import UIKit

class ArticlesListPresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingArticlesList() {
        interactor?.fetchArticlesList()
    }
    
    func showArticleDetailsController(navigationController: UINavigationController, selectedArticle: Results) {
        router?.pushToArticleDetailsScreen(navigationController: navigationController, selectedArticle: selectedArticle)
    }

}

extension ArticlesListPresenter: InteractorToPresenterProtocol{
    
    func articlesListFetchedSuccess(articlesListModelArray: Array<Results>) {
        view?.showArticlesList(articlesArray: articlesListModelArray)
    }
    
    func articlesListFetchFailed() {
        view?.showError()
    }
    
    
}
