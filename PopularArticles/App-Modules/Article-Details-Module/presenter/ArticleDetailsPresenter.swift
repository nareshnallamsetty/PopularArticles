//
//  ArticleDetailsPresenter.swift
//  PopularArticles
//
//  Created by Naresh Nallamsetty on 11/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetailsPresenter:ViewToPresenterDetailsProtocol {
    
    var view: PresenterToViewDetailsProtocol?
    
    var interactor: PresenterToInteractorDetailsProtocol?
    
    var router: PresenterToRouterDetailsProtocol?
    

}

extension ArticleDetailsPresenter: InteractorToPresenterDetailsProtocol{
}
