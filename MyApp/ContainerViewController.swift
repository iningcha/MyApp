//
//  ContainerViewController.swift
//  MyApp
//
//  Created by ChangSamantha on 7/19/17.
//  Copyright © 2017 Chang Samantha. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ContainerViewController: SlideMenuController {

    
    var mainViewControllers = [UIViewController]()
    
    override func awakeFromNib() {
        
        guard let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "Main") else{
            return
        }
        
        guard let leftViewController = self.storyboard?.instantiateViewController(withIdentifier: "Left") else{
            return
        }
        
        guard let myProfileTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "myProfileTableViewController") else{
            return
        }
        
        guard let settingsViewController = self.storyboard?.instantiateViewController(withIdentifier: "settingsViewController") else {
            return
        }
        
        mainViewControllers = [homeViewController, myProfileTableViewController, settingsViewController]
        
        self.mainViewController = homeViewController
        self.leftViewController = leftViewController
        
        super.awakeFromNib()
        
    }
    
    
    func changeMainViewController(byIndex index: Int, close: Bool = true) {
        
        let viewController = mainViewControllers[index]
        changeMainViewController(viewController, close: close)
        
    }
    
    
    func jumpToHome(){
        changeMainViewController(byIndex: 0, close: false)
    }
    
//    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
//        
//    }
//    

}
