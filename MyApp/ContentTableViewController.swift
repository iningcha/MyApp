//
//  ContentTableViewController.swift
//  MyApp
//
//  Created by ChangSamantha on 7/26/17.
//  Copyright © 2017 Chang Samantha. All rights reserved.
//

import UIKit

class ContentTableViewController: UITableViewController {
    
    var category: Category = .Music{
        didSet{
            self.title = category.rawValue
        }
    }
    var favorites:[Favorite?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favorites =  Favorite.array(forCategory: category) 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favorites.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 99
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as? musicTableViewCell else{
                fatalError("The dequeued cell is not an instance of musicTableViewCell")
        }
        
        let favorite = favorites[indexPath.row]
        
        cell.coverImageView.image = favorite!.photo
        cell.titleLabel.text = favorite!.title
        cell.authorLabel.text = favorite!.author
        cell.dateLabel.text = favorite!.date.description
        
        return cell
    }
    

}
