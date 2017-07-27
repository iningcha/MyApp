//
//  NewFavoriteViewController.swift
//  
//
//  Created by ChangSamantha on 7/20/17.
//
//

import UIKit
import XLForm

class NewFavoriteViewController: XLFormViewController {
    
    let tagType = "type"
    let tagDate = "date"
    let tagTitle = "title"
    let tagAuthor = "author"
    let tagComments = "comments"
    let tagImage = "image"
    
    //defining the class to store new favorite
    var storingFavorites : Favorite!
    
    
    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
        initializeForm()
    }
    
    func initializeForm() {
        // Implementation details covered in the next section.
        
        form = XLFormDescriptor(title: "Add Favorite")
        
        //Adding Sections
        
        let section1 = XLFormSectionDescriptor.formSection()
        let section2 = XLFormSectionDescriptor.formSection()
        
        
        
        //Type selector
        let type = XLFormRowDescriptor(tag: tagType , rowType:XLFormRowDescriptorTypeSelectorPush, title: "Type")
        type.selectorOptions = [XLFormOptionsObject(value:Category.Music, displayText: Category.Music.displayName), XLFormOptionsObject(value:Category.Books, displayText:Category.Books.displayName), XLFormOptionsObject(value:Category.TV, displayText:Category.TV.displayName)]
        type.value = type.selectorOptions?[1]
        section2.addFormRow(type)
        
        //date
        let date = XLFormRowDescriptor(tag: tagDate, rowType: XLFormRowDescriptorTypeDateInline, title:"Date")
        date.value = Date()
        section2.addFormRow(date)
        
        //Title
        let titleRow = XLFormRowDescriptor(tag: tagTitle, rowType: XLFormRowDescriptorTypeText)
        titleRow.cellConfigAtConfigure["textField.placeholder"] = "Title"
        section2.addFormRow(titleRow)
        
        //Arthor 
        let author = XLFormRowDescriptor(tag: tagAuthor, rowType: XLFormRowDescriptorTypeText)
        author.cellConfigAtConfigure["textField.placeholder"] = "Artist/Author/Creator"
        section2.addFormRow(author)
        
        //Comments
        let comments = XLFormRowDescriptor(tag: tagComments, rowType: XLFormRowDescriptorTypeTextView)
        comments.cellConfigAtConfigure["textView.placeholder"] = "Comments"
        section2.addFormRow(comments)
        
        
        //Cover Photo
        
        let coverPhoto = XLFormRowDescriptor(tag: tagImage, rowType: XLFormRowDescriptorTypeImage, title: "Image")
        coverPhoto.value = UIImage(named: "default")
        section1.addFormRow(coverPhoto)
        
        
        form.addFormSection(section1)
        form.addFormSection(section2)

        

    }
    
    override func storyboard(forRow formRow: XLFormRowDescriptor!) -> UIStoryboard! {
        return UIStoryboard(name: "iPhoneStoryboard", bundle:nil)
    }
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(NewFavoriteViewController.doneButtonDidClick))
        self.navigationItem.rightBarButtonItem = doneButton
        
        
        
        
        

        // Do any additional setup after loading the view.
        
        
//        self.tableView.contentInset.top = 64
    }
    
    func doneButtonDidClick(){
        getAllFormValues()
        navigationController?.popViewController(animated: true)
    }


    
    func getAllFormValues(){

        let results = form.formValues()
//
//        print ("hello1")
//        if let type = form.formRow(withTag: tagType)?.value{
//            results[tagType] = type as? String
//            print(type)
//
//        }
//        
        
        let title = results[tagTitle] ?? ""
        let type:Category = (results[tagType].map{($0 as! XLFormOptionsObject).formValue()} as? Category) ?? .Music
        let date:Date = results[tagDate] as? Date ?? Date()
        let author = results[tagAuthor] ?? ""
        let comments = results[tagComments] ?? ""
        let image = results["image"] as? UIImage

        
//        //  title
//        if let title = form.formRow(withTag: tagTitle)?.value {
//            results[tagTitle] = title as? String
//            print(title)
//        }
//        
//        //author
//        if let author = form.formRow(withTag: tagAuthor)?.value {
//            results[tagAuthor] = author as? String
//            print(author)
//        }
//        
//        //comments
//        if let comments = form.formRow(withTag: tagComments)?.value {
//            results[tagComments] = comments as? String
//            print(comments)
//        }
//        
        //cover photo
        
        // get data for each tag
        
        // store it into storingFavorites
        //(type: String, photo: UIImage?, date: String, title: String, author: String, comments: String)
      
        if let storingFavorites = Favorite(type: type, photo: image , date: date, title: title as! String, author: author as! String, comments: comments as! String){
//            let typeName:String = typeKeys[type as! Int]
//            
//            var typeArray = UserDefaults.standard.array(forKey: typeName) as? [[String:Any]]
//            
//            typeArray?.append(storingFavorites.represntToDict() ?? [:])
//            UserDefaults.standard.set(typeArray, forKey: typeName)
//            UserDefaults.standard.synchronize()
            
            Favorite.saveToUserDefaults(favorite: storingFavorites)
            
        }
        
        
        
        
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
