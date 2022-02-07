//
//  Favourite.swift
//  FitnessArena
//
//  Created by Akshay on 2022-02-02.
//

import Foundation
import UIKit
import ObjectMapper

class Favourite: NSObject, Mappable, NSCopying, NSCoding {
    
    // MARK: Properties
    
    var id: String?
    var title: String?
    var desc: String?
    var imageName: String?
    var category: String?
    var subCategory: String?
    
    
    init(id: String?, title: String?, desc: String?, imageName: String?,category: String?, subCategory: String?) {
        self.id = id
        self.title = title
        self.desc = desc
        self.imageName = imageName
        self.category = category
        self.subCategory = subCategory
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Favourite(id: id, title: title, desc: desc, imageName: imageName,category: category, subCategory: subCategory)
    }
    
    override init() {
        self.id = nil
        self.title = nil
        self.desc = nil
        self.imageName = nil
        self.category = nil
        self.subCategory = nil
    }
    
    // MARK: ObjectMapper Initalizers
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    required public init?(map: Map){
        
    }
    
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    public func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        desc <- map["desc"]
        imageName <- map["imageName"]
        category <- map["category"]
        subCategory <- map["subCategory"]
    }
    
    // MARK: NSCoding Protocol
    
    required public init(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "_id") as? String
        self.title = aDecoder.decodeObject(forKey: "title") as? String
        self.desc = aDecoder.decodeObject(forKey: "desc") as? String
        self.imageName = aDecoder.decodeObject(forKey: "imageName") as? String
        
    }

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "_id")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(desc, forKey: "desc")
        aCoder.encode(imageName, forKey: "imageName")
        
    }
}

