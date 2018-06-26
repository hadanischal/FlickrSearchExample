//
//  SearchResultsModel.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/22/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

struct SearchResultsModel: JSONCompatible {
    var page: Int
    var pages: Int
    var perpage: Int
    var total: String
    var photoResults: [PhotosModel]
    
    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        page = json["page"] as? Int ?? 0
        pages = json["pages"] as? Int ?? 0
        perpage = json["perpage"] as? Int ?? 0
        total = json["total"] as? String ?? ""
        photoResults = (json["photo"] as? [[String: Any]] ?? []).compactMap{PhotosModel(json: $0)}
    }
    
    init() {
        self.init(json: [:])!
    }
    
    init?(data: Data?) {
        guard let data = data else {return nil}
        guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {return nil}
        self.init(json: json)
    }
    
    init(page: Int, pages: Int, perpage: Int, total: String, photoResults: [PhotosModel]) {
        self.page = page
        self.pages = pages
        self.perpage = perpage
        self.total = total
        self.photoResults = photoResults
    }
    
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["page"] = page
        dict["pages"] = pages
        dict["perpage"] = perpage
        dict["total"] = total
        dict["photo"] = photoResults.compactMap{$0.jsonDictionary(useOriginalJsonKey: useOriginalJsonKey)}
        return dict
    }
}
extension SearchResultsModel : Parceable {
    static func parseObject(dictionary: [String : AnyObject]) -> Result<SearchResultsModel, ErrorResult> {
        //print(dictionary)
        if let dictionary = dictionary["photos"] as? [String:Any]{
            let result:SearchResultsModel! = SearchResultsModel.init(json: dictionary)
            return Result.success(result)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse flickr results"))
        }
    }
}
