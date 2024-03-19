//
//  CommentCell.swift
//  MVC
//
//  Created by mrgsdev on 19.03.2024.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var label: UILabel!
  

    func configure(with comment: Comment) {
        self.label.text = comment.name
        self.textView.text = comment.body
    }
}
