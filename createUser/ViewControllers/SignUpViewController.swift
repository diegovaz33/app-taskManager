//
//  SignUpViewController.swift
//  createUser
//
//  Created by Hugo Lopez Alguacil on 5/29/20.
//  Copyright © 2020 Hugo Lopez Alguacil. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class SignUpViewController: UIViewController {
    
    //MARK: Variables in the Sign Up View
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    //MARK: Setting Up the elements. Utilities under Helpers folder.
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        
        //Style the elements
    
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        
    }
    
    
        
    
    //Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise it returns the error method.
    func validateFields() -> String? {
        
        // -Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
             return "Please fill in all fields"
        }
        
        

        
        
        // -Secured password
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            
            //Password isn't secured enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
            
        }
        
        // If password is valid
        return nil
    }
    
    
    // Function for whenever you press sign up button
    @IBAction func signupTapped(_ sender: Any) {
        
        //Validate the fields
        
        let error = validateFields()
        if error != nil {
            //There is something wrong with the fields show error message
            showError(error!)
        }
        else {
            
            //Create clean version of the data.(stripout all white spaces)
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            
            //Create the user
            
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                //Check for errors
                if err != nil{
                    
                    //There was an error creating the user
                    self.showError("Error creating user")
                    
                    
                }
                else {
                    //User was created succesfully, now store first and last name

                    
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]){ (error) in
                        
                        //This means that there is an error
                        if error != nil {
                            // Show error message
                            self.showError("Error user saving data")
                            
                            
                        }
                    }
                    
                    //Transition to home screen
                    self.transitionToHome()
                        
                        
        
                    
                }
                
            }
        }
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
        
    }
    func transitionToHome(){
       let homeViewController = storyboard?.instantiateViewController(identifier: constants.Storyboard.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    
}
