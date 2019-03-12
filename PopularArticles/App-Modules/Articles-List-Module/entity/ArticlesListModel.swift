//
//  ArticlesListModel.swift
//  PopularArticles
//
//  Created by Naresh Nallamsetty on 11/03/19.
//  Copyright © 2019 Naresh Nallamsetty. All rights reserved.
//


import Foundation
struct ArticlesListModel : Codable {
    let status : String?
    let copyright : String?
    let num_results : Int?
    let results : [Results]?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case copyright = "copyright"
        case num_results = "num_results"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        num_results = try values.decodeIfPresent(Int.self, forKey: .num_results)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }
    
}

struct MediaMetadata : Codable {
    let url : String?
    let format : String?
    let height : Int?
    let width : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        format = try values.decodeIfPresent(String.self, forKey: .format)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
    }
    
}

struct Media : Codable {
    let type : String?
    let subtype : String?
    let caption : String?
    let copyright : String?
    let approved_for_syndication : Int?
    let mediaMetadata : [MediaMetadata]?
    
    enum CodingKeys: String, CodingKey {
        
        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approved_for_syndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        subtype = try values.decodeIfPresent(String.self, forKey: .subtype)
        caption = try values.decodeIfPresent(String.self, forKey: .caption)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        approved_for_syndication = try values.decodeIfPresent(Int.self, forKey: .approved_for_syndication)
        mediaMetadata = try values.decodeIfPresent([MediaMetadata].self, forKey: .mediaMetadata)
    }
    
}

struct Results : Codable {
    let url : String?
    let adx_keywords : String?
    let column : String?
    let section : String?
    let byline : String?
    let type : String?
    let title : String?
    let abstract : String?
    let published_date : String?
    let source : String?
    let id : Int?
    let asset_id : Int?
    let views : Int?
    let media : [Media]?
    
    enum CodingKeys: String, CodingKey {
        
        case url = "url"
        case adx_keywords = "adx_keywords"
        case column = "column"
        case section = "section"
        case byline = "byline"
        case type = "type"
        case title = "title"
        case abstract = "abstract"
        case published_date = "published_date"
        case source = "source"
        case id = "id"
        case asset_id = "asset_id"
        case views = "views"
        case media = "media"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        adx_keywords = try values.decodeIfPresent(String.self, forKey: .adx_keywords)
        column = try values.decodeIfPresent(String.self, forKey: .column)
        section = try values.decodeIfPresent(String.self, forKey: .section)
        byline = try values.decodeIfPresent(String.self, forKey: .byline)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
        published_date = try values.decodeIfPresent(String.self, forKey: .published_date)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        asset_id = try values.decodeIfPresent(Int.self, forKey: .asset_id)
        views = try values.decodeIfPresent(Int.self, forKey: .views)
        media = try values.decodeIfPresent([Media].self, forKey: .media)
    }
    
}

