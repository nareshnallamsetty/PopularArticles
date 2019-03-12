//
//  ArticleDetailsProtocols.swift
//  PopularArticles
//
//  Created by Naresh Nallamsetty on 11/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterDetailsProtocol: class{
    
    var view: PresenterToViewDetailsProtocol? {get set}
    var interactor: PresenterToInteractorDetailsProtocol? {get set}
    var router: PresenterToRouterDetailsProtocol? {get set}
}

protocol PresenterToViewDetailsProtocol: class{
    func showArticleDetails(articleDetails: Results)
}

protocol PresenterToRouterDetailsProtocol: class {
    static func createModule()-> ArticleDetailsViewController
}

protocol PresenterToInteractorDetailsProtocol: class {
    var presenter:InteractorToPresenterDetailsProtocol? {get set}
}

protocol InteractorToPresenterDetailsProtocol: class {
}
