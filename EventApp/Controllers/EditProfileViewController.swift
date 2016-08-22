//
//  EditProfileViewController.swift
//  EventApp
//
//  Created by Michael Darche on 8/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class EditProfileViewController: UITableViewController {

    let imagePicker = UIImagePickerController()
    let headerTitles = ["PUBLIC PROFILE", "PRIVATE INFORMATION"]
    private var editProfileImage : Bool?
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var firstnameField: UITextField!  { didSet {firstnameField.delegate = self} }
    @IBOutlet weak var lastnameField: UITextField!  { didSet {lastnameField.delegate = self} }
    @IBOutlet weak var usernameField: UITextField!  { didSet {usernameField.delegate = self} }
    @IBOutlet weak var currentCityField: UITextField!  { didSet {currentCityField.delegate = self} }
    @IBOutlet weak var descriptionField: UITextField!  { didSet {descriptionField.delegate = self} }
    @IBOutlet weak var emailField: UITextField!  { didSet {emailField.delegate = self} }
    @IBOutlet weak var phoneNumberField: UITextField!  { didSet {phoneNumberField.delegate = self} }
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        setCurrentInformation()
    }
    
    
    // MARK: Class Functions
    
    func setCurrentInformation() {
        // TODO: Grab data from disk
    }
    
    
    func visualize() {
        imagePicker.delegate = self
        saveButton.layer.cornerRadius = saveButton.frame.size.height/2
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        
    }
    
    @IBAction func editProfileImagePressed(sender: AnyObject) {
        editProfileImage = true
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func editCoverImagePressed(sender: AnyObject) {
        editProfileImage = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    
    // MARK: Tableview Functions
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView()
        header.backgroundColor = UIColor(red: 225/255, green: 228/255, blue: 234/255, alpha: 1.0)
        
        let headerLabel = UILabel(frame: CGRectMake(12, 0, 150, 30))
        headerLabel.font = UIFont(name: "Roboto-Medium", size: 12)
        headerLabel.textColor = UIColor(white: 0, alpha: 0.3)
        
        headerLabel.textAlignment = .Left
        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
        
        header.addSubview(headerLabel)
        
        return header
    }
}


extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        if editProfileImage == true {
            profileImage.image = pickedImage
            profileImage.layoutIfNeeded()
        } else {
            coverImage.image = pickedImage
            coverImage.layoutIfNeeded()
        }
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
}


extension EditProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


