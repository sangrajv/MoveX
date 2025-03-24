//
//  HomeViewController.swift
//  MoveX
//
//  Created by Rajvir Sangha on 2025-03-20.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class HomeViewController: UIViewController {
    
    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Log Out",
                                      message: "Are you sure you want to log out?",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
            self.performLogout()
        }))
    
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func performLogout() {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            print("Firebase sign-out successful.")
            
            if GIDSignIn.sharedInstance.currentUser != nil {
                GIDSignIn.sharedInstance.signOut()
                print("Google sign-out successful.")
            }
            
            self.performSegue(withIdentifier: "HomeToWelcome", sender: self)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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


