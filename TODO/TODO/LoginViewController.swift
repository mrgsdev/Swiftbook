//
//  ViewController.swift
//  TODO
//
//  Created by mrgsdev on 01.03.2024.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var warnLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        print(1)
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
    }


}

