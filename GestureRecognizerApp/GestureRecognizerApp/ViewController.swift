//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Emre Gemici on 13.07.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var islewis = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    
    @objc func changePic () {
        
        if islewis == true{
            imageView.image = UIImage(named: "sebastianVettel")
            myLabel.text = "Sebastian Vettel"
            islewis=false
            
        }
        else {
            imageView.image=UIImage(named: "lewisHamilton")
            myLabel.text = "Lewis Hamilton"
            islewis = true
        }

    }


}

