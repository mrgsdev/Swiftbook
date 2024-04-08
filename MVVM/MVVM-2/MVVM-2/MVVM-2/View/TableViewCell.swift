//
//  TableViewCell.swift
//  MVVM-2
//
//  Created by mrgsdev on 08.04.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    weak var viewModel: (TableViewCellViewModelType)? {
        willSet(viewModel){
            
                nameLabel.text = viewModel?.name
                secondNameLabel.text = viewModel?.secondName
                ageLabel.text = viewModel?.age
         
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
