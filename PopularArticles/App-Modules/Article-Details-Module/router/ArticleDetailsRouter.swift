//
//  ArticleDetailsRouter.swift
//  PopularArticles
//
//  Created by Naresh Nallamsetty on 11/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetailsRouter:PresenterToRouterDetailsProtocol{
    
    static func createModule() -> ArticleDetailsViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: ARTICLE_DETAILS_VIEWCONTROLLER_STORYBOARD_ID) as! ArticleDetailsViewController
        
        let presenter: ViewToPresenterDetailsProtocol & InteractorToPresenterDetailsProtocol = ArticleDetailsPresenter()
        let interactor: PresenterToInteractorDetailsProtocol = ArticleDetailsInteractor()
        let router:PresenterToRouterDetailsProtocol = ArticleDetailsRouter()
        
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
    
}
