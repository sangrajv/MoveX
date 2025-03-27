//
//  IssueStatusViewController.swift
//  MoveX
//
//  Created by Rajvir Sangha on 2025-03-26.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import FirebaseFirestore

class IssueStatusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    
    var issues: [(body: String, contactMethod: String, contactInfo: String, Status: String)] = []
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIssues()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
         
        
        
         tableCell.textLabel?.text = "Issue Number \(indexPath.row + 1)"
         tableCell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
         tableCell.accessoryType = .disclosureIndicator
         
         return tableCell
     }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let issue = issues[indexPath.row]
         let issueStatus = issue.Status.isEmpty ? "Issue Submitted" : issue.Status
         let alert = UIAlertController(
             title: "Issue Details",
             message: "Issue: \(issue.body)\nContact: \(issue.contactMethod) - \(issue.contactInfo)\nStatus: \(issueStatus)",
             preferredStyle: .alert
         )
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         self.present(alert, animated: true, completion: nil)
     }
    
    func loadIssues() {
            db.collection("Issues").getDocuments { (querySnapshot, error) in
                if let e = error {
                    print("Error getting the data: \(e)")
                } else {
                    self.issues.removeAll()
                    
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let body = data["Body"] as? String,
                               let contactMethod = data["ContactMethod"] as? String,
                               let contactInfo = data["ContactInfo"] as? String,
                               let Status = data["Status"] as? String
                            {
                                self.issues.append((body: body, contactMethod: contactMethod, contactInfo: contactInfo, Status: Status))
                            }
                        }
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


