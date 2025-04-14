//
//  HomeViewController.swift
//  MoveX
//
//  Created by Rajvir Singh Sangha on 2025-03-20.
/*
 Once the user is logged in, they come to this page. Since I (Rajvir) implemented the firebase auth in this project, I only implemented the log out button in this vc.
 */

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class HomeViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    //adding segue
    @IBAction func unwindToHOME(segue: UIStoryboardSegue) {
        
    }
    
    //For the logout button tapped
    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
        
        // Display an alert asking the user to confirm logout
        let alert = UIAlertController(title: "Log Out",
                                      message: "Are you sure you want to log out?",
                                      preferredStyle: .alert)
        
        // If user confirms, call the performLogout() function
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
            self.performLogout()
        }))
    
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    //This function performs the logout process for both Firebase and Google
    func performLogout() {
        let firebaseAuth = Auth.auth()
        
        do {
            // Sign out from Firebase
            try firebaseAuth.signOut()
            print("Firebase sign-out successful.")
            
            // If signed in with Google, sign out from Google as well
            if GIDSignIn.sharedInstance.currentUser != nil {
                GIDSignIn.sharedInstance.signOut()
                print("Google sign-out successful.")
            }
            
            // Navigate back to the welcome screen after logout
            self.performSegue(withIdentifier: "HomeToWelcome", sender: self)
        } catch let signOutError as NSError {
            
            
            // Print any error that occurs during sign out
            print("Error signing out: %@", signOutError)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToChatPressed(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    
    //method by: Yashika Saini
    // Purpose: Triggered when a workout button is tapped.
    // It retrieves the selected workout data based on the button's tag
    // and presents a popover with detailed workout information.
    @IBAction func workoutButtonTapped(_ sender: UIButton) {
            let index = sender.tag
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let selectedWorkout = appDelegate.workoutData[index]

        // WHY: Instantiate and configure the popover view controller to display workout details.
        if let popoverVC = storyboard?.instantiateViewController(withIdentifier: "WorkoutPopoverViewController") as? WorkoutPopoverViewController {
                popoverVC.modalPresentationStyle = .popover
                popoverVC.preferredContentSize = CGSize(width: 300, height: 400)
                popoverVC.workoutData = selectedWorkout
            // WHY: Set up the popover’s anchor point and presentation style.
                if let popover = popoverVC.popoverPresentationController {
                    popover.sourceView = sender
                    popover.sourceRect = sender.bounds
                    popover.permittedArrowDirections = .up
                    popover.delegate = self
                }
                present(popoverVC, animated: true, completion: nil)
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


