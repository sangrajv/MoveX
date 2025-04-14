//
//  IssueStatusViewController.swift
//  MoveX
//
//  Created by Rajvir Singh Sangha on 2025-03-26.
/*
 This VC pulls all the issues from the firestore and displays them to the user in the table view format. Users can use this page to see the status of their issue, like whether it is submitted or under review.
 
 The MoveX support team can update the status of the issue on the firebase console and it will automatically be updated for the user.
 */

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import FirebaseFirestore

class IssueStatusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    // This array stores the issues retrieved from Firestore.
    // Each issue is a tuple containing body, contact method, contact info, and status.
    var issues: [(body: String, contactMethod: String, contactInfo: String, Status: String)] = []
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the issues from Firestore whenever the view is loaded
        loadIssues()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //number of rows equal to the fetched issues
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    // Configuring and returning the cell for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
         
        
         // Display the issue number on the cell
         tableCell.textLabel?.text = "Issue Number \(indexPath.row + 1)"
         tableCell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
         tableCell.accessoryType = .disclosureIndicator
         
         return tableCell
     }

    //Once the user selected the cell, it displays the full details of the selected issue in an alert.
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let issue = issues[indexPath.row]
         
         // If the status is empty, it will show "Issue Submitted"
         let issueStatus = issue.Status.isEmpty ? "Issue Submitted" : issue.Status
        
         // Displaying the alert with issue details
         let alert = UIAlertController(
             title: "Issue Details",
             message: "Issue: \(issue.body)\nContact: \(issue.contactMethod) - \(issue.contactInfo)\nStatus: \(issueStatus)",
             preferredStyle: .alert
         )
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         self.present(alert, animated: true, completion: nil)
     }
    
    
    
    // This function loads all issues from Firestore
    func loadIssues() {
            db.collection("Issues").getDocuments { (querySnapshot, error) in
               
                // Print error if there's an issue fetching the data
                if let e = error {
                    print("Error getting the data: \(e)")
                } else {
                    self.issues.removeAll()
                    
                    // Loop through all documents returned
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let body = data["Body"] as? String,
                               let contactMethod = data["ContactMethod"] as? String,
                               let contactInfo = data["ContactInfo"] as? String,
                               let Status = data["Status"] as? String
                            {
                                
                                // Append each issue to the issues array
                                self.issues.append((body: body, contactMethod: contactMethod, contactInfo: contactInfo, Status: Status))
                            }
                        }
                        
                        // Reload the table view with updated data
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


