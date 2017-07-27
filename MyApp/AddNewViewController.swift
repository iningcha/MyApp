////
////  AddNewViewController.swift
////  MyApp
////
////  Created by ChangSamantha on 7/20/17.
////  Copyright © 2017 Chang Samantha. All rights reserved.
////
//
//import UIKit
//import os.log
//
//class AddNewViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    
//    @IBOutlet weak var categoryTextField: UITextField!
//    @IBOutlet weak var categoryPicker: UIPickerView!
//    @IBOutlet weak var doneButton: UIBarButtonItem!
//    @IBOutlet weak var titleTextField: UITextField!
//    @IBOutlet weak var ArtistTextField: UITextField!
//    @IBOutlet weak var commentsText: UITextView!
//    @IBOutlet weak var coverPictureImageView: UIImageView!
//
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        commentsText.layer.cornerRadius = 4
//        commentsText.layer.borderWidth = 1
//        commentsText.layer.borderColor = UIColor.darkGray.cgColor
//    }
//   
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    // For the category picker
//    var category = ["Music", "Books", "TV Show"]
//    
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int{
//        return 1
//        
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
//        
//        return category.count
//        
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        
//        self.view.endEditing(true)
//        return category[row]
//        
//    }
//    
//   
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        
//        self.categoryTextField.text = self.category[row]
//        self.categoryPicker.isHidden = true
//        
//    }
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        
//        if textField == self.categoryTextField {
//            self.categoryPicker.isHidden = false
//            //if you dont want the users to se the keyboard type:
//            
//            textField.endEditing(true)
//            
//            doneButton.isEnabled = false
//        }
//        
//    }
//   
//    
//// MARK: Navigation
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//        
//        guard let button = sender as? UIBarButtonItem, button === doneButton else {
//            os_log("The done button was not pressed, canelling", log: OSLog.default,
//                   type: .debug)
//            return
//        }
//        
//   
//        
//}
//
////MARK: UIImagePickerControllerDelegate
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        //Dismiss the picker if the user canceled
//        dismiss(animated: true, completion: nil)
//    }
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        
//        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
//            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
//        }
//        
//        //set photoImageView to display the selected Image
//        coverPictureImageView.image = selectedImage
//        
//        //dismiss the picker
//        dismiss(animated: true, completion: nil)
//    }
//    
//    
//// MARK: Actions 
//    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
//        //Hide the keyboard
//        categoryTextField.resignFirstResponder()
//        
//        //lets user pick media from their photo library
//        
//     let imagePickerController = UIImagePickerController()
//        // only allow pictures to be picked, not taken
//        imagePickerController.sourceType = .photoLibrary
//        
//        //make sure ViewController is notified when the user picks an iamge
//        imagePickerController.delegate = self
//        
//        present(imagePickerController, animated: true, completion: nil)
//}
//
//
//}
