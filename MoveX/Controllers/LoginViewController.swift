//
//  LoginViewController.swift
//  MoveX
//
//  Created by Rajvir Singh Sangha on 2025-03-19.
/*
 This vc has two main features I implemented, first is the login using email and pw, users can log in using their email and password that they registered with. Once the login button is clicked, again FirebaseAuth is used to authenticate the user.

 I have again also added error handling here. So if the user enters incorrect credentials, an alert is shown with the error message returned by Firebase.

 Second main functionality here is that I have also included the Google Sign-In. If the user prefers to sign in with their Google account, they can tap on the Google Sign-In button. The app will authenticate the user using Google and Firebase, and then take the user to the home page if successful.
 
 */

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    // This method is for logging in the users
    @IBAction func loginButton(_ sender: UIButton) {
        
        
        // Checking if both email and password fields have values
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            // Using FirebaseAuth to sign in the user with email and password
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                // If there's an error from Firebase, show the alert with the error message
                if let e = error {
                    print(e.localizedDescription)
                    let alert = UIAlertController(title: "Registration Failed", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
                
                // If login is successful, navigate the user to the home screen
                else{
                    self.performSegue(withIdentifier: "LoginToHome", sender: self)
                }
               
            }
            
        }
        
    }
    
    
    // This method is for Google Sign-In button
    @IBAction func googleSignInButtonTapped(_ sender: UIButton) {
        
            
        // Getting the client ID from Firebase configuration
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config
            
           let presentingVC = self
            
        
        // Initiating the Google sign-in process
            GIDSignIn.sharedInstance.signIn(withPresenting: presentingVC) { result, error in
                if let error = error {
                    print("Google Sign-In failed: \(error.localizedDescription)")
                    return
                }
                
                // Getting the Google user and the required tokens
                guard let user = result?.user, let idToken = user.idToken?.tokenString else { return }
                
                // Creating a Firebase console credential using the Google tokens
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
                
                //Signing in the user to Firebase with Google credential
                Auth.auth().signIn(with: credential) { authResult, error in
                    if let error = error {
                        print("Firebase Sign-In failed: \(error.localizedDescription)")
                    } else {
                        print("User signed in successfully")
                        self.performSegue(withIdentifier: "LoginToHome", sender: self)
                    }
                }
            }
        }
    
    
    // This method allows the keyboard to hide when the return key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return textField.resignFirstResponder()
        }
    
    
    
    
    // unwind to login vc
    @IBAction func unwidToLoginVC(sender: UIStoryboardSegue)
    {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
