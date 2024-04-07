//
//  ViewController.swift
//  MVVM-1
//
//  Created by mrgsdev on 05.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var secondName: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var profile: Profile? {
        didSet{
            guard let profile else {
          return
            }
            self.nameLabel.text = profile.name
            self.secondName.text = profile.secondName
            self.ageLabel.text = "\(profile.age)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profile = Profile(name: "John", secondName: "Smith", age: 2)
        
    }


}

