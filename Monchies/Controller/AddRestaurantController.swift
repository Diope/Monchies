//
//  AddRestaurantController.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/12/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit
import CoreData


class AddRestaurantController: UITableViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  var brandColor = UIColor(red: 0.004207400605, green: 0.8167108297, blue: 0.8440560699, alpha: 1)
  var restaurant: RestaurantMO!
  
  @IBOutlet weak var photoImageView: UIImageView!
  
  @IBOutlet weak var nameTextField: RoundedTextField! {
    didSet {
      nameTextField.tag = 1
      nameTextField.becomeFirstResponder()
      nameTextField.delegate = self
    }
  }
  
  @IBOutlet weak var typeTextField: RoundedTextField! {
    didSet {
      typeTextField.tag = 2
      typeTextField.delegate = self
    }
  }
  
  @IBOutlet weak var addressTextField: RoundedTextField! {
    didSet {
      addressTextField.tag = 3
      addressTextField.delegate = self
    }
  }
  
  @IBOutlet weak var phoneTextField: RoundedTextField! {
    didSet {
      phoneTextField.tag = 4
      phoneTextField.delegate = self
    }
  }
  
  @IBOutlet weak var descriptionTextView: UITextView! {
    didSet {
      
      let dtv = descriptionTextView
      dtv!.delegate = self
      dtv!.tag = 5
      dtv!.layer.cornerRadius = 4.0
      dtv!.layer.masksToBounds = true
      dtv!.textColor = UIColor.label
      dtv!.layer.backgroundColor = UIColor.systemGray4.cgColor
      dtv!.text = "How do you feel about this restaurant?"
//      descriptionTextView.selectedTextRange = descriptionTextView.textRange(from: descriptionTextView.beginningOfDocument, to: dtv!.endOfDocument)
    }
  
  }
  
  
  
  @IBAction func saveButton(sender: AnyObject) {
    
    
    if nameTextField.text == "" || typeTextField.text == "" || addressTextField.text == "" || descriptionTextView.text == "" {
      let alertController = UIAlertController(title: "Oops", message: "One or more fields are blank, please note that all fields are required", preferredStyle: .alert)
      let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
      
      alertController.addAction(alertAction)
      present(alertController, animated: true, completion: nil)
      
      return
    }
    // MARK: - Inserting Context Data
    if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
      restaurant = RestaurantMO(context: appDelegate.persistentContainer.viewContext)
      restaurant.name = nameTextField.text
      restaurant.type = typeTextField.text
      restaurant.location = addressTextField.text
      restaurant.phone = phoneTextField.text
      restaurant.summary = descriptionTextView.text
      restaurant.isVisited = false
      
      
      if let restaurantImage = photoImageView.image {
        restaurant.image = restaurantImage.pngData()
      }
      print("context writing has worked")
      appDelegate.saveContext()
    }
    
    dismiss(animated: true, completion: nil)
    

  }
  

  override func viewDidLoad() {
        super.viewDidLoad()
    
      photoImageView.image = UIImage(named: "placeholder_image")
      photoImageView.isHidden = true
      navigationController?.navigationBar.tintColor = .white
      navigationController?.navigationBar.shadowImage = UIImage()
      if let customFont = UIFont(name: "Raleway-Medium", size: 35.0) {
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: brandColor, NSAttributedString.Key.font: customFont ]
      }
      
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let nextTextField = view.viewWithTag(textField.tag + 1) {
      textField.resignFirstResponder()
      nextTextField.becomeFirstResponder()
    }
    return true
  }

  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      let photoSourceRequestController = UIAlertController(title: "", message: "Choose your photo source", preferredStyle: .actionSheet)
      
      let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {(action) in
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
          let imagePicker = UIImagePickerController()
          imagePicker.allowsEditing = false
          imagePicker.sourceType = .camera
          imagePicker.delegate = self
          
          self.present(imagePicker, animated: true, completion: nil)
        }
      })
      
      let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {(action) in
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
          let imagePicker = UIImagePickerController()
          imagePicker.allowsEditing = false
          imagePicker.sourceType = .photoLibrary
          imagePicker.delegate = self
          
          self.present(imagePicker, animated: true, completion: nil)
        }
      })
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      
      
      photoSourceRequestController.addAction(cameraAction)
      photoSourceRequestController.addAction(photoLibraryAction)
      photoSourceRequestController.addAction(cancelAction)
      present(photoSourceRequestController, animated: true, completion: nil)
    }

  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      photoImageView.image = selectedImage
      photoImageView.contentMode = .scaleAspectFill
      photoImageView.clipsToBounds = true
      photoImageView.isHidden = false
    } 
    
    let leadingConstraint = NSLayoutConstraint(item: photoImageView as Any, attribute: .leading, relatedBy: .equal, toItem: photoImageView.superview, attribute: .leading, multiplier: 1, constant: 0)
    leadingConstraint.isActive = true
    
    let trailingConstraint = NSLayoutConstraint(item: photoImageView as Any, attribute: .trailing, relatedBy: .equal, toItem: photoImageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
    trailingConstraint.isActive = true
    
    let topConstraint = NSLayoutConstraint(item: photoImageView as Any, attribute: .top, relatedBy: .equal, toItem: photoImageView.superview, attribute: .top, multiplier: 1, constant: 0)
    topConstraint.isActive = true
    
    let bottomConstraint = NSLayoutConstraint(item: photoImageView as Any, attribute: .bottom, relatedBy: .equal, toItem: photoImageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
    bottomConstraint.isActive = true
    
    dismiss(animated: true, completion: nil)
  }

    // MARK: - Table view data source
  
  
  
//  func textViewDidBeginEditing(_ textView: UITextView) {
//    if descriptionTextView.textColor == UIColor.lightGray {
//      descriptionTextView.text = nil
//      descriptionTextView.textColor = .black
//    }
//  }
//  
//  func textViewDidEndEditing(_ textView: UITextView) {
//    if descriptionTextView.text.isEmpty {
//      descriptionTextView.text = "How do you feel about this restaurant?"
//      descriptionTextView.textColor = UIColor.lightGray
//    }
//  }
  
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    let currentText:String = descriptionTextView.text
    let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
    
    if updatedText.isEmpty {
      descriptionTextView.text = "How do you feel about this restaurant?"
      descriptionTextView.textColor = UIColor.placeholderText
      
      descriptionTextView.selectedTextRange = descriptionTextView.textRange(from: descriptionTextView.beginningOfDocument, to: descriptionTextView.beginningOfDocument)
    } else if descriptionTextView.textColor == UIColor.placeholderText && !text.isEmpty {
      descriptionTextView.textColor = .label
      descriptionTextView.text = text
    } else {
      return true
    }
    return false
  }
  
//  func textViewDidChangeSelection(_ textView: UITextView) {
//    if self.view != nil {
//      if descriptionTextView.textColor == UIColor.lightGray {
//        descriptionTextView.selectedTextRange = descriptionTextView.textRange(from: descriptionTextView.beginningOfDocument, to: descriptionTextView.beginningOfDocument)
//      }
//    }
//  }
}
