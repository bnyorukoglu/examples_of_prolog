//
//  ViewController.swift
//  IoSProject
//
//  Created by 109895 on 30.08.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var FirstButton: UIButton!
    
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func someAction(_ sender: Any) {
        myLabel.text = "Hoşgeldiniz"
        FirstButton.setTitle("butona tıklandı", for: .normal)
    
    }
    
}

