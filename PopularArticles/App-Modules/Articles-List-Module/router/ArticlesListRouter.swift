//
//  ArticlesListRouter.swift
//  PopularArticles
//
//  Created by Naresh Nallamsetty on 11/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

import Foundation
import UIKit

class ArticlesListRouter:PresenterToRouterProtocol{
    
    static func createModule() -> ArticlesListViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: ARTICLES_LIST_VIEWCONTROLLER_STORYBOARD_ID) as! ArticlesListViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ArticlesListPresenter()
        let interactor: PresenterToInteractorProtocol = ArticlesListInteractor()
        let router:PresenterToRouterProtocol = ArticlesListRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:MAIN_STORYBOARD_NAME,bundle: Bundle.main)
    }
    
    func pushToArticleDetailsScreen(navigationController: UINavigationController, selectedArticle: Results) {
        let articleDetailsModule = ArticleDetailsRouter.createModule()
        articleDetailsModule.articleDetails = selectedArticle
        navigationController.pushViewController(articleDetailsModule,animated: true)
    }
}
