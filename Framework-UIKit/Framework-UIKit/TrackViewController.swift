//
//  TrackViewController.swift
//  Framework-UIKit
//
//  Created by mrgsdev on 19.02.2024.
//

import UIKit

class TrackViewController: UIViewController {
    
    var trackTitle = ""
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: trackTitle)
        titleLabel.text = trackTitle
    }

}
