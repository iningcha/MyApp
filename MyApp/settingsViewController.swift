//
//  settingsViewController.swift
//  MyApp
//
//  Created by ChangSamantha on 7/25/17.
//  Copyright © 2017 Chang Samantha. All rights reserved.
//

import UIKit
import XLForm

class settingsViewController: XLFormViewController {
    
    
    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
        initializeForm()
    }
    
    func initializeForm() {
        // Implementation details covered in the next section.
        
        form = XLFormDescriptor(title: "Settings")
        
        //Adding Sections
        
        let section1 = XLFormSectionDescriptor.formSection()
        
        
        
        //Invite Friends
        let inviteFriends = XLFormRowDescriptor(tag: "push" , rowType:XLFormRowDescriptorTypeSelectorPush, title: "Invite Friends")
        inviteFriends.selectorOptions = [XLFormOptionsObject(value:0, displayText: "Option1"), XLFormOptionsObject(value:1, displayText:"Option2"), XLFormOptionsObject(value:2, displayText:"TV")]
        inviteFriends.value = XLFormOptionsObject(value: 1, displayText: "Option2")
        section1.addFormRow(inviteFriends)
        
        //connect to social media
        let socialMedia = XLFormRowDescriptor(tag: "push" , rowType:XLFormRowDescriptorTypeSelectorPush, title: "Connect to Social Media")
        socialMedia.selectorOptions = [XLFormOptionsObject(value:0, displayText: "Option1"), XLFormOptionsObject(value:1, displayText:"Option2"), XLFormOptionsObject(value:2, displayText:"TV")]
        socialMedia.value = XLFormOptionsObject(value: 1, displayText: "Option2")
        section1.addFormRow(socialMedia)

        
        
        //edit profile
        let editProfile = XLFormRowDescriptor(tag: "push" , rowType:XLFormRowDescriptorTypeSelectorPush, title: "Edit Profile")
        editProfile.selectorOptions = [XLFormOptionsObject(value:0, displayText: "Option1"), XLFormOptionsObject(value:1, displayText:"Option2"), XLFormOptionsObject(value:2, displayText:"TV")]
        editProfile.value = XLFormOptionsObject(value: 1, displayText: "Option2")
        section1.addFormRow(editProfile)
        
        //change password
        let changePassword = XLFormRowDescriptor(tag: "push" , rowType:XLFormRowDescriptorTypeSelectorPush, title: "Change Password")
        changePassword.selectorOptions = [XLFormOptionsObject(value:0, displayText: "Option1"), XLFormOptionsObject(value:1, displayText:"Option2"), XLFormOptionsObject(value:2, displayText:"TV")]
        changePassword.value = XLFormOptionsObject(value: 1, displayText: "Option2")
        section1.addFormRow(changePassword)

        
        form.addFormSection(section1)
        
        
    }
    
    override func storyboard(forRow formRow: XLFormRowDescriptor!) -> UIStoryboard! {
        return UIStoryboard(name: "iPhoneStoryboard", bundle:nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(settingsViewController.backButtonDidClick))
        self.navigationItem.leftBarButtonItem = backButton
        
        
        
        
        
        // Do any additional setup after loading the view.
        
        
        //        self.tableView.contentInset.top = 64
    }
    
    func backButtonDidClick(){
        self.slideMenuController()?.openLeft()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
