//
//  PhotosModel.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/22/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

struct PhotosModel: JSONCompatible {
    var id: String
    var owner: String
    var secret: String
    var server: String
    var farm: Int
    var title: String
    var ispublic: Bool
    var isfriend: Bool
    var isfamily: Bool
    
    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        id = json["id"] as? String ?? ""
        owner = json["owner"] as? String ?? ""
        secret = json["secret"] as? String ?? ""
        server = json["server"] as? String ?? ""
        farm = json["farm"] as? Int ?? 0
        title = json["title"] as? String ?? ""
        
        ispublic = json["ispublic"] as? Bool ?? false
        isfriend = json["isfriend"] as? Bool ?? false
        isfamily = json["isfamily"] as? Bool ?? false
    }
    
    init() {
        self.init(json: [:])!
    }
    
    init?(data: Data?) {
        guard let data = data else {return nil}
        guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {return nil}
        self.init(json: json)
    }
    
    init(id: String, owner: String, secret: String, server: String, farm: Int, title:String, ispublic:Bool, isfriend:Bool, isfamily:Bool) {
        self.id = id
        self.owner = owner
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
        self.ispublic = ispublic
        self.isfriend = isfriend
        self.isfamily =  isfamily
    }
    
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["id"] = id
        dict["owner"] = owner
        dict["secret"] = secret
        dict["server"] = server
        dict["farm"] = farm
        dict["title"] = title
        dict["ispublic"] = ispublic
        dict["isfriend"] = isfriend
        dict["isfamily"] = isfamily
        return dict
    }
    
    func flickrImageURL(_ size:String = "m") -> URL?{
        if let url =  URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_\(size).jpg") {
            return url
        }
        return nil
    }
}



