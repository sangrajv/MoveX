//
//  IssueViewController.swift
//  MoveX
//
//  Created by Rajvir Singh Sangha on 2025-03-25.
/*
 This VC allows users to submit any issue they're facing while creating an account. This VC can be accessed from the welcome page as user won't have to be logged in to submit the issue.
 
 The user can enter the issue details, select their preferred contact method (Email, Call, SMS, or Telegram), and provide the corresponding contact info. I have added a picker view in this vc for this task.
 
  On tapping the Send button, the issue gets saved in Firebase Firestore under the "Issues" collection. Error handling is also added. Once successfully submitted, the user is shown a confirmation alert.
 
 */

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import FirebaseFirestore


class IssueViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var issuetv: UITextView!
       @IBOutlet var contacttf: UITextField!
       @IBOutlet var contactPicker: UIPickerView!
       
       // List of contact methods user can select from
       let contact = ["Email", "Call", "SMS", "Telegram"]
    
    
       let db = Firestore.firestore()

       // Number of components in picker
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return contact.count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return contact[row]
       }
       
    
       // When a contact method is selected from the pickerview, updating the text field's placeholder
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
       
        //saving the information in the FireStore
       @IBAction func onSendPressed(_ sender: UIButton) {
           
           // Checking that both text view and contact field are not empty
           guard let issueBody = issuetv.text, !issueBody.isEmpty,
                 let contactInfo = contacttf.text, !contactInfo.isEmpty else {
               
               //alert box incase user has not filled in the information
               let alert = UIAlertController(title: "Invalid Information", message: "Please fill out all fields", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self.present(alert, animated: true, completion: nil)
               return
           }
           
           // Get selected contact method
           let selectedContactMethod = contact[contactPicker.selectedRow(inComponent: 0)]
           
           
           // Save issue info to Firestore
           db.collection("Issues").addDocument(data: [
               "Body": issueBody,
               "ContactMethod": selectedContactMethod,
               "ContactInfo": contactInfo,
               
               // This status can be used by the MoveX team close the ticket and can also be used to provide update on the issue, such as status is under review etc.
               "Status": ""
           ]) { error in
               
               // Show error alert if Firestore fails
               if let e = error {
                   let alert = UIAlertController(title: "Error in Submission", message: "Please review all field and try again.", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                   self.present(alert, animated: true, completion: nil)
               } else {
                   print("Successfully saved the data")
                   
                   
                   // On successful submission
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
    
