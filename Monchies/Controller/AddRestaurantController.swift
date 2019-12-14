//
//  AddRestaurantController.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/12/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {
  
  var brandColor = UIColor(red: 0.004207400605, green: 0.8167108297, blue: 0.8440560699, alpha: 1)
  
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
      dtv!.layer.backgroundColor = UIColor.systemGray5.cgColor
      dtv!.text = "How do you feel about this restaurant?"
//      descriptionTextView.selectedTextRange = descriptionTextView.textRange(from: descriptionTextView.beginningOfDocument, to: dtv!.endOfDocument)
    }
  
  }

    override func viewDidLoad() {
        super.viewDidLoad()

      navigationController?.navigationBar.tintColor = .white
      navigationController?.navigationBar.shadowImage = UIImage()
      if let customFont = UIFont(name: "Raleway-Medium", size: 35.0) {
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: brandColor, NSAttributedString.Key.font: customFont ]
      }
      
    }

    // MARK: - Table view data source
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let nextTextField = view.viewWithTag(textField.tag + 1) {
      textField.resignFirstResponder()
      nextTextField.becomeFirstResponder()
    }
    return true
  }
  
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
      descriptionTextView.textColor = UIColor.lightGray
      
      descriptionTextView.selectedTextRange = descriptionTextView.textRange(from: descriptionTextView.beginningOfDocument, to: descriptionTextView.beginningOfDocument)
    } else if descriptionTextView.textColor == UIColor.systemGray2 && !text.isEmpty {
      descriptionTextView.textColor = .black
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
