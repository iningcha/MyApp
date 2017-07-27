//
//  Utilites.swift
//  MyApp
//
//  Created by ChangSamantha on 7/26/17.
//  Copyright © 2017 Chang Samantha. All rights reserved.
//

import UIKit

enum Category : String {
    
    case Music = "Music"
    case Books = "Books"
    case TV = "TVShows"
    
    var backgroundImage:UIImage{
        switch self {
        case .Music:
            return #imageLiteral(resourceName: "Music")
        case .Books:
            return #imageLiteral(resourceName: "Books")
        case .TV:
            return #imageLiteral(resourceName: "TV")
        }
    }
    
    var type: String{
        return rawValue
    }
    
    var displayName:String{
        switch self{
        case .Music:
            return "Music"
        case .Books:
            return "Books"
        case .TV:
            return "TV"
        }
    }
    
}


//class FavoriteAssistant {
//    
//    
//    static func save(favorite: Favorite){
//        
//        var typeArray = UserDefaults.standard.array(forKey: favorite.type.rawValue) as? [[String:Any]]
//        
//        typeArray?.append(favorite.represntToDict() ?? [:])
//        UserDefaults.standard.set(typeArray, forKey: favorite.type.rawValue)
//        UserDefaults.standard.synchronize()
//        
//    }
//    
//    
//    static func array(forCategory category: Category)->[[String:Any]]{
//        return UserDefaults.standard.array(forKey: category.rawValue) as? [[String:Any]] ?? []
//    }
//    
//    static func array(forCategory category: Category)->[Favorite?]{
//        return array(forCategory:category).map{ Favorite(dict: $0) }
//    }
//    
//    static func array(forCategory categoryName: String)->[Favorite?]{
//        
//        let category = Category(rawValue: categoryName) ?? .Music
//        return array(forCategory:category).map{ Favorite(dict: $0) }
//    }
//    
//}


extension Favorite {
    
    
    static func saveToUserDefaults(favorite: Favorite){
        
        var typeArray = UserDefaults.standard.array(forKey: favorite.type.rawValue) as? [[String:Any]]
        
        typeArray?.append(favorite.represntToDict() ?? [:])
        UserDefaults.standard.set(typeArray, forKey: favorite.type.rawValue)
        UserDefaults.standard.synchronize()
        
    }
    
    
    static func array(forCategory category: Category)->[[String:Any]]{
        return UserDefaults.standard.array(forKey: category.rawValue) as? [[String:Any]] ?? []
    }
    
    static func array(forCategory category: Category)->[Favorite?]{
        return array(forCategory:category).map{ Favorite(dict: $0) }
    }
    
    static func array(forCategory categoryName: String)->[Favorite?]{
        
        let category = Category(rawValue: categoryName) ?? .Music
        return array(forCategory:category).map{ Favorite(dict: $0) }
    }
//  //delete the favorite chosen by the user
//    static func deleteFavorite(favorite: Favorite){
//        UserDefaults.standard.removeObject(forKey: favorite.title)
//        
//    }
    
}
