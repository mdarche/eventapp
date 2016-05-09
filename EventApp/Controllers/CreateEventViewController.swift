//
//  CreateEventViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit
import MapKit

class CreateEventViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var uploadImageButton: UIButton!
    
    @IBOutlet weak var eventTitleField: UITextField!
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    @IBOutlet weak var eventDurationField: UITextField!
    @IBOutlet weak var inviteSwitch: UISwitch!
    
    @IBOutlet weak var streetField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var eventMap: MKMapView!
    
    let imagePicker = UIImagePickerController()
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        dismissVC()
    }
    
    
    
    // MARK: View's Transition Handler
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // TODO
    }
    
    
    
    // MARK: Class functions
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func dismissButton(sender: AnyObject) {
        dismissVC()
    }
    
    @IBAction func selectImageButton(sender: AnyObject) {
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addGuestButton(sender: AnyObject) {
    
    }
    
    @IBAction func createEventButton(sender: AnyObject) {
    
    }
    
    func dismissVC() {
        dismissViewControllerAnimated(true, completion: {
            UIApplication.sharedApplication().statusBarHidden = false
            self.tabBarController?.tabBar.hidden = false
        })
    }
    
    func test() {
        
    }
    
    func visualize() {
        eventDatePicker.setValue(UIColor.whiteColor(), forKey: "textColor")
        eventDatePicker.sendAction(#selector(CreateEventViewController.test), to: nil, forEvent: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateEventViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        imagePicker.delegate = self
    }
}


extension CreateEventViewController {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        eventImage.contentMode = .ScaleAspectFill
        eventImage.layer.masksToBounds = true
        eventImage.image = pickedImage
        eventImage.layoutIfNeeded()
        uploadImageButton.setImage(nil, forState: .Normal)
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
