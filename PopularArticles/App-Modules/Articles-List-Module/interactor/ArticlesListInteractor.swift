//
//  ArticlesListInteractor.swift
//  PopularArticles
//
//  Created by Naresh Nallamsetty on 11/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

import Foundation
import Alamofire

class ArticlesListInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    // Function which deals with the Articles API
    func fetchArticlesList() {
        Alamofire.request(API_MOST_VIEWED_ARTICLES_LIST).responseData{ (response:DataResponse<Data>) in
            
            switch(response.result) {
            case let .success(data):
                do {
                    let resultData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    print(resultData)
                    // Decoding the JSON response to codable structure
                    let jsonDecoder = JSONDecoder()
                    let articlesListResponse = try jsonDecoder.decode(ArticlesListModel.self, from: data)
                    if let articlesData = articlesListResponse.results {
                        self.presenter?.articlesListFetchedSuccess(articlesListModelArray: articlesData)
                    }

                } catch let error {
                    print(error)
                    self.presenter?.articlesListFetchFailed()
                }
                break
                
            case .failure(_):
                print(response.result.error.debugDescription)
                self.presenter?.articlesListFetchFailed()
            }
           
        }
        
    }
    
    
    
    
}
