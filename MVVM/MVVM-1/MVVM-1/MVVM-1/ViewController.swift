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
    
    var viewModel:ViewModel! {
        didSet{
            self.nameLabel.text = viewModel?.name
            self.secondName.text = viewModel?.secondName
            self.ageLabel.text = viewModel?.age
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel = ViewModel()
       
        
    }


}

