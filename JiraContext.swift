//
//  JiraContext.swift
//  TayBreth
//
//  Created by J Patrick Davenport on 7/19/16.
//  Copyright © 2016 J Patrick Davenport. All rights reserved.
//

import UIKit

class JiraContext : NSObject, NSCoding {
    // MARK: Properties
    var username: String
    var password: String
    var url: String
    
    // MARK: Types
    struct PropertyKey {
        static let passwordKey = "name"
        static let usernameKey = "photo"
        static let urlKey = "rating"
    }
    
    override convenience init() {
        self.init (username: "",password: "",url: "")
    }
    
    init(username: String, password: String, url:String) {
        self.username = username
        self.password = password
        self.url = url
    }
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.username, forKey: PropertyKey.usernameKey)
        aCoder.encode(self.password, forKey:PropertyKey.passwordKey)
        aCoder.encode(self.url, forKey: PropertyKey.urlKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let username = aDecoder.decodeObject(forKey: PropertyKey.usernameKey) as! String
        let password = aDecoder.decodeObject(forKey: PropertyKey.passwordKey) as! String
        let url = aDecoder.decodeObject(forKey: PropertyKey.urlKey) as! String
        self.init(username: username, password: password, url: url)
    }
    
}
