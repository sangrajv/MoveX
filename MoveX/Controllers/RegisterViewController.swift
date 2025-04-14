//
//  RegisterViewController.swift
//  MoveX
//
//  Created by Rajvir Singh Sangha on 2025-03-19.
/*
 This vc is for the registration page for the user which gives the users with an option to enter their email and password. Once the user click on register, a user will be created in the firebase auth console.
 I have also implemented the error catch here, so incase user enters an invalid email or password, the user will get an alert message for with the text that is received from the firebase.
 
 */

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //method to register the user in the firebase
    @IBAction func registerButton(_ sender: UIButton) {
            
        //Checking if both email and password fields have values
            if let email = emailTextField.text, let password = passwordTextField.text{
                
                //using the FirebaseAuth methods to create the user
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    
                    //taking the error recived from firebase and converting it into local language
                    if let e = error {
                        print(e.localizedDescription)
                        
                        //showing that received error in the alert box to the user
                        let alert = UIAlertController(title: "Registration Failed", message: e.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(alert, animated: true)
                    } else{
                        
                        //navigate to Login view controller
                            self.performSegue(withIdentifier: "RegisterToLogin", sender: self)
                        }
                        
                    }
                    
                    
                }
            }
    
    //unwind to register
    @IBAction func unwidToRegisterVC(sender: UIStoryboardSegue)
    {
        
    }
    
    //method to remove the keyboard from screen using the return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return textField.resignFirstResponder()
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




