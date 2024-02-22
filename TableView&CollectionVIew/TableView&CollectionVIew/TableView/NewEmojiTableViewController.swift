//
//  NewEmojiTableViewController.swift
//  TableView&CollectionVIew
//
//  Created by mrgsdev on 21.02.2024.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    var emoji = EmojiModel(emoji: "", name: "", description: "", isFavourite: false)
    
    
    @IBOutlet weak var newEmojiTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSabeButton()
        updateUI()
    }
    
    
    private func updateSabeButton(){
        let newEmoji = newEmojiTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        saveButton.isEnabled  = !nameText.isEmpty && !description.isEmpty && !newEmoji.isEmpty
    }
    
    
    
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSabeButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else {
            return
        }
        let emoji = newEmojiTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        self.emoji = EmojiModel(emoji: emoji, name: name, description: description, isFavourite: self.emoji.isFavourite)
    }
    
    private func updateUI(){
        newEmojiTextField.text = emoji.emoji
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
    }
    
}
