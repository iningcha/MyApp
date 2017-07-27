//
//  favorite.swift
//  MyApp
//
//  Created by ChangSamantha on 7/25/17.
//  Copyright © 2017 Chang Samantha. All rights reserved.
//

import UIKit


class Favorite {
    
    //MARK: Properties
    
    var type: Category
    var photo: UIImage?
    var date: Date
    var title: String
    var author: String
    var comments: String
    
    //MARK: Initialization
    
    init?(type: Category, photo: UIImage?, date: Date, title: String, author: String, comments: String) {
        
        // The type must not be empty
        
        guard !title.isEmpty else {
            return nil
        }
        
        guard !author.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.type = type
        self.photo = photo
        self.date = date
        self.title = title
        self.author = author
        self.comments = comments
        
    }
    
    convenience init?(dict: [String: Any]){
        
        guard let type = dict["type"] as? String else{
            return nil
        }
        
        guard let date = dict["date"] as? Date else{
            return nil
        }
        
        guard let title = dict["title"] as? String else{
            return nil
        }
        
        guard let author = dict["author"] as? String else{
            return nil
        }
        
        guard let comments = dict["comments"] as? String else{
            return nil
        }
        
        let imageData = dict["photo"] as? Data
        
        let photoImage = (imageData != nil) ? UIImage(data: imageData!) : nil
        
        self.init(type: Category(rawValue: type) ?? .Music, photo: photoImage, date: date, title: title, author: author, comments: comments)
        
    }
    
    
//    func representToJSON()->Data?{
//        let dict = [
//                    "type":type,
//                    "title":title
//            
//        ]
//        
//        return JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
//    }
//    
    func represntToDict()->[String:Any]?{
        
        var dict:[String:Any] = [
            "type":type.rawValue,
            "title":title,
            "date":date,
            "author":author,
            "comments":comments
        ]
        
        if let photo = photo {
            let photoData = UIImageJPEGRepresentation(photo, 0.8)
            dict["photo"] = photoData
        }
        
        return dict
        
    }
    
}
