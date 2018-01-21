//
//  LoginViewController.swift
//  JaganInterViewTest
//
//  Created by Ammulu on 20/01/18.
//  Copyright © 2018 JaganMohan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func loginAction(_ sender: Any) {
        if emailTextField.text == "jagan@gmail.com" && passwordTextField.text == "123456" {
            performSegue(withIdentifier: "homeView", sender: self)
        }
        else {
            let alertController = UIAlertController(title: nil, message: "Please enter correct details", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = segue.destination as? HomeViewController {
        }
    }
}
