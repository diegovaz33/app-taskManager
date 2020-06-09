//
//  LogInViewController.swift
//  createUser
//
//  Created by Hugo Lopez Alguacil on 5/29/20.
//  Copyright © 2020 Hugo Lopez Alguacil. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    //MARK: -Variables in Log in View
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
   
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
        
    }
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        //Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleFilledButton(logInButton)
 
        
        
    }



    
    
    @IBAction func logInTapped(_ sender: Any) {
        
        
        
        // Validate the text fields
        
        
        
        //Signing in the user
        
    }
    
    
    
}
