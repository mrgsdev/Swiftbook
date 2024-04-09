//
//  DetailViewController.swift
//  MVVM-2
//
//  Created by mrgsdev on 09.04.2024.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    var viewModel: DetailViewViewModelType?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let viewModel  else { return  }
        self.textLabel.text = viewModel.description
    } 

}
