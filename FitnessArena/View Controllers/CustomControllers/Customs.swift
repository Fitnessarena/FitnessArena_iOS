//
//  Customs.swift
//  FitnessArena
//
//  Created by Akshay on 2022-02-17.
//

import Foundation
import UIKit
import ObjectMapper

class Customs: NSObject, Mappable, NSCopying, NSCoding {
    
    // MARK: Properties
    
    var id: String?
    var title: String?
    var desc: String?
    var imageName: String?
    var category: String?
    var subCategory: String?
    var weights: String?
    var repititions: String?
    var dateTime: String?
    
    init(id: String?, title: String?, desc: String?, imageName: String?,category: String?, subCategory: String?, weights: String?, repititions: String?, dateTime: String?) {
        self.id = id
        self.title = title
        self.desc = desc
        self.imageName = imageName
        self.category = category
        self.subCategory = subCategory
        self.weights = weights
        self.repititions = repititions
        self.dateTime = dateTime
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Customs(id: id, title: title, desc: desc, imageName: imageName,category: category, subCategory: subCategory, weights: weights, repititions: repititions, dateTime: dateTime)
    }
    
    override init() {
        self.id = nil
        self.title = nil
        self.desc = nil
        self.imageName = nil
        self.category = nil
        self.subCategory = nil
        self.weights = nil
        self.repititions = nil
        self.dateTime = nil
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
        weights <- map["weights"]
        repititions <- map["repititions"]
        dateTime <- map["dateTime"]
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

