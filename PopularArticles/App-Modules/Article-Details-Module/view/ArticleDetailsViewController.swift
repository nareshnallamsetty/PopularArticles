//
//  ArticleDetailsViewController.swift
//  PopularArticles
//
//  Created by Naresh Nallamsetty on 11/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: UIViewController {

    var presentor:ViewToPresenterDetailsProtocol?
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    var articleDetails:Results!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ARTICLE_DETAILS_TITLE
        
        // Rendering the selected article details
        titleLabel.text = self.articleDetails.title ?? ""
        bylineLabel.text = self.articleDetails.byline ?? ""
        publishedDateLabel.text =  self.articleDetails.published_date ?? ""
        abstractLabel.text =  self.articleDetails.abstract ?? ""
        
        // Setting up the square image
        let imageUrl = getSquareImageURL()
        if let url = URL(string: imageUrl) {
            self.articleImageView.sd_setImage(with: url, placeholderImage: UIImage(named: ARTICLE_DEFAULT_IMAGE))
        } else {
            if let encodedURLString = imageUrl.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
                if let url = URL(string: encodedURLString) {
                    self.articleImageView.sd_setImage(with: url, placeholderImage: UIImage(named: ARTICLE_DEFAULT_IMAGE))
                }
            }
        }
    }
    
    // Function to get the square image from media meta data
    func getSquareImageURL() -> String {
        if let mediaInfo = articleDetails.media, !mediaInfo.isEmpty {
            if let metaData = mediaInfo.first?.mediaMetadata, !metaData.isEmpty {
                let thumbNailMetaData = metaData.filter({ "\($0.format ?? "")" == SQUARE_IMAGE_KEY})
                if !thumbNailMetaData.isEmpty {
                    return thumbNailMetaData.first?.url ?? ""
                }
            }
        }
        return ""
    }
}

extension ArticleDetailsViewController:PresenterToViewDetailsProtocol{
    func showArticleDetails(articleDetails: Results) {
        self.articleDetails = articleDetails
    }
}





