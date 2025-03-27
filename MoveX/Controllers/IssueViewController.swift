//
//  IssueViewController.swift
//  MoveX
//
//  Created by Rajvir Sangha on 2025-03-25.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import FirebaseFirestore


class IssueViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var issuetv: UITextView!
       @IBOutlet var contacttf: UITextField!
       @IBOutlet var contactPicker: UIPickerView!
       
       let contact = ["Email", "Call", "SMS", "Telegram"]
       let db = Firestore.firestore()

       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return contact.count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return contact[row]
       }
       
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           switch contact[row] {
           case "Email":
               contacttf.placeholder = "Enter your email address"
           case "Call":
               contacttf.placeholder = "Enter your phone number"
           case "SMS":
               contacttf.placeholder = "Enter your phone number"
           case "Telegram":
               contacttf.placeholder = "Enter your Telegram username"
           default:
               contacttf.placeholder = "Enter your contact information"
           }
       }
       
       @IBAction func onSendPressed(_ sender: UIButton) {
           guard let issueBody = issuetv.text, !issueBody.isEmpty,
                 let contactInfo = contacttf.text, !contactInfo.isEmpty else {
               let alert = UIAlertController(title: "Invalid Information", message: "Please fill out all fields", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self.present(alert, animated: true, completion: nil)
               return
           }
           
           let selectedContactMethod = contact[contactPicker.selectedRow(inComponent: 0)]
           
           db.collection("Issues").addDocument(data: [
               "Body": issueBody,
               "ContactMethod": selectedContactMethod,
               "ContactInfo": contactInfo
           ]) { error in
               if let e = error {
                   let alert = UIAlertController(title: "Error in Submission", message: "Please review all field and try again.", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                   self.present(alert, animated: true, completion: nil)
               } else {
                   print("Successfully saved the data")
                   
                   let alert = UIAlertController(title: "Submission Successful", message: "Someone from our team will contact you soon.", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { ac in
                       self.dismiss(animated: true)
                   }))
                   self.present(alert, animated: true, completion: nil)

               }
           }
       }
                
            
    @IBAction func unwidToIssuesVC(sender: UIStoryboardSegue)
    {
        
    }
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                // Do any additional setup after loading the view.
            }
            
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
            
            /*
             // MARK: - Navigation
             
             // In a storyboard-based application, you will often want to do a little preparation before navigation
             override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             // Get the new view controller using segue.destination.
             // Pass the selected object to the new view controller.
             }
             */
        }
    
