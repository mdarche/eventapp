//
//  EditProfileViewController.swift
//  EventApp
//
//  Created by Michael Darche on 6/17/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class EditProfileViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerView2: UIView!
    
    @IBOutlet weak var firstNameField: UITextField! { didSet {firstNameField.delegate = self} }
    @IBOutlet weak var lastNameField: UITextField! { didSet {lastNameField.delegate = self} }
    @IBOutlet weak var usernameField: UITextField! { didSet {usernameField.delegate = self} }
    @IBOutlet weak var cityField: UITextField! { didSet {cityField.delegate = self} }
    @IBOutlet weak var bioField: UITextField! { didSet {bioField.delegate = self} }
    @IBOutlet weak var emailField: UITextField! { didSet {emailField.delegate = self} }
    @IBOutlet weak var telephoneField: UITextField! { didSet {telephoneField.delegate = self} }
    
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
//        UIView.animateWithDuration(0.3, animations: {
//            self.navigationController?.navigationBar.barTintColor = Colors.mainBlueFull
//        })
        setCurrentInformation()
    }
    
    
    func setCurrentInformation() {
        // TODO: Grab data from disk
    }
    
    
    func visualize() {
        imagePicker.delegate = self
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        
        headerView.layer.shadowColor = UIColor.blackColor().CGColor
        headerView2.layer.shadowColor = UIColor.blackColor().CGColor
        
        let saveButtonItem = UIBarButtonItem(title: "SAVE", style: .Plain, target: self, action: #selector(EditProfileViewController.saveChanges))
        let font = UIFont.systemFontOfSize(12)
        saveButtonItem.setTitleTextAttributes([ NSFontAttributeName: font], forState: .Normal)
        self.navigationItem.rightBarButtonItem = saveButtonItem
        
        tableView?.addInvisibleHeader(.whiteColor(), sender: self.tableView, size: 50)
    }
    
    func saveChanges() {
        
    }
    
    @IBAction func editImageButton(sender: AnyObject) {
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
}


extension EditProfileViewController {
    
    // MARK: Profile Image Picker Delegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        profileImage.contentMode = .ScaleAspectFill
        profileImage.layer.masksToBounds = true
        profileImage.image = pickedImage
        profileImage.layoutIfNeeded()
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension EditProfileViewController {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
