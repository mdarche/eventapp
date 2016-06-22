//
//  EditProfileViewController.swift
//  EventApp
//
//  Created by Michael Darche on 6/17/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit

class EditProfileViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
        UIView.animateWithDuration(0.3, animations: {
            self.navigationController?.navigationBar.barTintColor = Colors.mainBlueFull
        })
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        setCurrentInformation()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        
        UIView.animateWithDuration(0.3, animations: {
            self.navigationController?.navigationBar.barTintColor = Colors.mainDarkFull
        })
    }
    
    
    func setCurrentInformation() {
        // TODO: Grab data from disk
    }
    
    
    func visualize() {
        imagePicker.delegate = self
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
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
