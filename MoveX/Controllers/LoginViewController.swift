//
//  LoginViewController.swift
//  MoveX
//
//  Created by Rajvir Sangha on 2025-03-19.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   // @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                    let alert = UIAlertController(title: "Registration Failed", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
                
                else{
                    self.performSegue(withIdentifier: "LoginToHome", sender: self)
                }
               
            }
            
        }
        
    }
    
    @IBAction func googleSignInButtonTapped(_ sender: UIButton) {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config
            
           // guard let presentingVC = self.view.window?.rootViewController else { return }
           let presentingVC = self
            
            GIDSignIn.sharedInstance.signIn(withPresenting: presentingVC) { result, error in
                if let error = error {
                    print("Google Sign-In failed: \(error.localizedDescription)")
                    return
                }
                
                guard let user = result?.user, let idToken = user.idToken?.tokenString else { return }
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
                
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
