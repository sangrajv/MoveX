//
//  RegisterViewController.swift
//  MoveX
//
//  Created by Rajvir Sangha on 2025-03-19.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerButton(_ sender: UIButton) {
            
            if let email = emailTextField.text, let password = passwordTextField.text{
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                        print(e.localizedDescription)
                        let alert = UIAlertController(title: "Registration Failed", message: e.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(alert, animated: true)
                    } else{
                        //Navigate to Login view controller
                            self.performSegue(withIdentifier: "RegisterToLogin", sender: self)
                        }
                        
                    }
                    
                    
                }
            }
    @IBAction func unwidToRegisterVC(sender: UIStoryboardSegue)
    {
        
    }
    
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




