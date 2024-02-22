//
//  TableViewCell.swift
//  TableView&CollectionVIew
//
//  Created by mrgsdev on 20.02.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageEmoji: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(object: EmojiModel)  {
        self.imageEmoji.text = object.emoji
        self.nameLabel.text = object.name
        self.descriptionLabel.text = object.description
    }
}
