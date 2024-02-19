//
//  CollectionViewController.swift
//  Framework-UIKit
//
//  Created by mrgsdev on 19.02.2024.
//

import UIKit

class CollectionViewController: UIViewController {

    var info: String?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = info {
            imageView.image = UIImage(named: text)
            infoLabel.text = info
        }
    }
    
 

}
