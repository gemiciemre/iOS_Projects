//
//  ViewController.swift
//  SignUpApp
//
//  Created by Emre Gemici on 13.07.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2text: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signupAction(_ sender: Any) {
       /*
        let alert = UIAlertController(title: "Error!", message: "Username not found!", preferredStyle: UIAlertController.Style.alert)
        self.present( alert, animated: true, completion:nil)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            print("button Clicked")
        }
        alert.addAction(okButton)
        */
        
        if usernameText.text == ""{
            makeAlert(title: "Error!", message: "User Not Found!")
            
        }
        else if passwordText.text == ""{
            makeAlert(title: "Error!", message: "Password Not Found!")
        }
        else if password2text.text != passwordText.text {
            makeAlert(title: "Error!", message: "Password do not match!")
        }
        else{
            makeAlert(title: "Success", message: "User Registered")
        }
    }
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message , preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

