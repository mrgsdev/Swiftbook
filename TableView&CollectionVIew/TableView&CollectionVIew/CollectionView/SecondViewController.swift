//
//  SecondViewController.swift
//  TableView&CollectionVIew
//
//  Created by mrgsdev on 23.02.2024.
//

import UIKit

class SecondViewController: UIViewController {

    var image: UIImage?
    
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.image = image
    }
    
    @IBAction func shareAction(_ sender: Any) {
    }

}
