//
//  FavoriteTableViewController.swift
//  MyApp
//
//  Created by ChangSamantha on 7/19/17.
//  Copyright © 2017 Chang Samantha. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class FavoriteTableViewController: UITableViewController {
    
    var favoriteCategories:[Category] = [.Music, .Books, .TV]
    
    var receivedFavorite: Favorite!
    
    var musicFavorites = [Favorite]()
    var bookFavorites = [Favorite]()
    var tvFavorites = [Favorite]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iconImageView = UIImageView(image: #imageLiteral(resourceName: "fave"))
        self.navigationItem.titleView = iconImageView
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func menuItemPressed(sender: Any?){
        self.slideMenuController()?.openLeft()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 207
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favoriteCategories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let Cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as? FavoriteTableViewCell else{
                fatalError("The dequeued cell is not an instance of FavoriteTableViewCell")
        }
        
        let category = favoriteCategories[indexPath.row]
        
        Cell.backgroundImageView.image = category.backgroundImage
        Cell.categoryLabel.text = category.displayName

        return Cell
    }
    

    
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue){
        
        
        
        if sender.source is NewFavoriteViewController{
            let viewController = sender.source as? NewFavoriteViewController
            receivedFavorite =  viewController?.storingFavorites
            
        }
        
        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "contentSegue" {
            let category = sender as! Category
            
            if let contentTableViewController = segue.destination as? ContentTableViewController {
                contentTableViewController.category = category
            }
        }
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
        
        
        let category = favoriteCategories[indexPath.row]
        performSegue(withIdentifier: "contentSegue", sender: category)
        
//        if category["type"] == "Music" {
//            performSegue(withIdentifier: "musicSegue", sender: self)
//        }
//            
//        else if category["type"] == "Books" {
//            performSegue(withIdentifier: "bookSegue", sender: self)        }
//            
//        else if category["type"] == "TV" {
//            performSegue(withIdentifier: "TVSegue", sender: self)        }
        
    }
    



}
