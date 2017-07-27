//
//  myProfileTableViewController.swift
//  MyApp
//
//  Created by ChangSamantha on 7/21/17.
//  Copyright © 2017 Chang Samantha. All rights reserved.
//

import UIKit

class myProfileTableViewController: UITableViewController {


    var favorites:[Favorite?] = []
    var category: Category = .Music

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating the back button
        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(myProfileTableViewController.backButtonDidClick))
        self.navigationItem.leftBarButtonItem = backButton
        
        
        //adding the favorites from the UserDefaults to the array
        favorites =  Favorite.array(forCategory: category)
        favorites.append(contentsOf: Favorite.array(forCategory: .Books))
        favorites.append(contentsOf: Favorite.array(forCategory: .TV))
        
        //sorting it by the date
        favorites.sort(by: {$0?.date.compare(($1?.date)!) == .orderedDescending})
        
        
    }
    
    func backButtonDidClick(){
        self.slideMenuController()?.openLeft()

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            as? myProfileTableViewCell else{
                fatalError("The dequeued cell is not an instance of myProfileTableViewCell")
        }
        
        let favorite = favorites[indexPath.row]
        
        cell.coverImageView.image = favorite!.photo
        cell.titleLabel.text = favorite!.title
        cell.authorLabel.text = favorite!.author
        cell.dateLabel.text = favorite!.date.description
        
        return cell
    }

    

}
