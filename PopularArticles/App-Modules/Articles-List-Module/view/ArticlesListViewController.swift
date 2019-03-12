//
//  ArticlesListViewController.swift
//  PopularArticles
//
//  Created by Naresh Nallamsetty on 11/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

import UIKit
import SDWebImage

class ArticlesListViewController: UIViewController {

    var presentor:ViewToPresenterProtocol?
    
    @IBOutlet weak var articlesTableView: UITableView!
    var articlesArrayList:Array<Results> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ARTICLES_LIST_TITLE
        
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
        articlesTableView.tableFooterView = UIView.init()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Asking presentor to fetch the articles list
        showProgressIndicator(view: self.view)
        presentor?.startFetchingArticlesList()
    }
}

extension ArticlesListViewController:PresenterToViewProtocol{
    
    // Rendering the articles list
    func showArticlesList(articlesArray: Array<Results>) {
        self.articlesArrayList = articlesArray
        self.articlesTableView.reloadData()
        hideProgressIndicator(view: self.view)
    }
    
    // Will be fired on failure
    func showError() {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem while Fetching the Articles", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}


extension ArticlesListViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: ARTICLES_CELL_IDENTIFIER, for: indexPath) as! ArticlesCell
        
        // Rendering up the article basic info
        let articleInfo = articlesArrayList[indexPath.row]
        cell.titleLabel.text = articleInfo.title ?? ""
        cell.byLineLabel.text = articleInfo.byline ?? ""
        cell.publishedDateButton.setTitle(articleInfo.published_date ?? "", for: .normal)
        
        // Setting up the thumbnail image of article
        let imageUrl = getThumbnailImageURLOf(article: articleInfo)
        if let url = URL(string: imageUrl) {
            cell.articleImageView.sd_setImage(with: url, placeholderImage: UIImage(named: ARTICLE_DEFAULT_IMAGE))
        } else {
            if let encodedURLString = imageUrl.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
                if let url = URL(string: encodedURLString) {
                    cell.articleImageView.sd_setImage(with: url, placeholderImage: UIImage(named: ARTICLE_DEFAULT_IMAGE))
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleInfo = articlesArrayList[indexPath.row]
        presentor?.showArticleDetailsController(navigationController: navigationController!, selectedArticle: articleInfo)
    }
    
    // Funnction that fetches the thumbnail image url from media data
    func getThumbnailImageURLOf(article: Results) -> String {
        if let mediaInfo = article.media, !mediaInfo.isEmpty {
            if let metaData = mediaInfo.first?.mediaMetadata, !metaData.isEmpty {
                let thumbNailMetaData = metaData.filter({ "\($0.format ?? "")" == THUMBNAIL_KEY})
                if !thumbNailMetaData.isEmpty {
                    return thumbNailMetaData.first?.url ?? ""
                }
            }
        }
        return ""
    }
    
}

class ArticlesCell:UITableViewCell{
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var publishedDateButton: UIButton!
}



