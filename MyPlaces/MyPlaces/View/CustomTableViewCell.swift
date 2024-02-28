//
//  CustomTableViewCell.swift
//  MyPlaces
//
//  Created by mrgsdev on 24.02.2024.
//

import UIKit
import Cosmos

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cosmosView: CosmosView! {
        didSet{
            cosmosView.settings.updateOnTouch = false
        }
    }
    @IBOutlet weak var imageOfPlace: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
     
}
