//
//  PassDataSecondViewController.swift
//  FirstApps
//
//  Created by mrgsdev on 18.02.2024.
//  final n

import UIKit

class PassDataSecondViewController: UIViewController {

    var login: String?
    
    @IBOutlet weak var goBackUI: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let login = self.login else { return }
        label.text = "Hello " + login + "."
        goBackUI.layer.cornerRadius = 15
        goBackUI.clipsToBounds = true
    }
    

     
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
   
}
