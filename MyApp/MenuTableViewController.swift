//
//  MenuTableViewController.swift
//  MyApp
//
//  Created by ChangSamantha on 7/19/17.
//  Copyright © 2017 Chang Samantha. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let containerViewController = self.slideMenuController() as? ContainerViewController else{
            return
        }
        
        
        containerViewController.changeMainViewController(byIndex: indexPath.row, close: true)
        
            }
    
    
}
