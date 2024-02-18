//
//  PassDataViewController.swift
//  FirstApps
//
//  Creatasdadssadfffed by mrgsdev on 18.02.2024.
// sas

import UIKit

class PassDataViewController: UIViewController {

    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var performButtonUI: UIButton!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var loginButtonUI: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButtonUI.layer.cornerRadius = 15
        performButtonUI.layer.cornerRadius = 15
        loginButtonUI.clipsToBounds = true
        performButtonUI.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    

 
    @IBAction func performSegueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    @IBAction func loginButton(_ sender: UIButton) {
        
    }
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        guard let svc = segue.source as? PassDataSecondViewController else { return }
        self.resultLabel.text = svc.label.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? PassDataSecondViewController else { return }
        dvc.login = loginTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
