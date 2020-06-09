//
//  ViewController.swift
//  createUser
//
//  Created by Hugo Lopez Alguacil on 5/29/20.
//  Copyright © 2020 Hugo Lopez Alguacil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var logInButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements(){
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(logInButton)
        
        
        
    }

    

}

