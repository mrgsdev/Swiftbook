//
//  TableViewController.swift
//  TableView&CollectionVIew
//
//  Created by mrgsdev on 20.02.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    let emojis = [
        EmojiModel(emoji: "Image 1", name: "Name 1", description: "Description 1", isFavourite: false),
        EmojiModel(emoji: "Image 2", name: "Name 2", description: "Description 2", isFavourite: false),
        EmojiModel(emoji: "Image 3", name: "Name 3", description: "Description 3", isFavourite: false),
        EmojiModel(emoji: "Image 4", name: "Name 4", description: "Description 4", isFavourite: false),
        EmojiModel(emoji: "Image 5", name: "Name 5", description: "Description 5", isFavourite: false),
        EmojiModel(emoji: "Image 6", name: "Name 6", description: "Description 6", isFavourite: false),
        EmojiModel(emoji: "Image 7", name: "Name 7", description: "Description 7", isFavourite: false),
        EmojiModel(emoji: "Image 8", name: "Name 8", description: "Description 8", isFavourite: false),
        EmojiModel(emoji: "Image 9", name: "Name 9", description: "Description 9", isFavourite: false),
        EmojiModel(emoji: "Image 10", name: "Name 10", description: "Description 10", isFavourite: false),
        EmojiModel(emoji: "Image 11", name: "Name 11", description: "Description 11", isFavourite: false),
        EmojiModel(emoji: "Image 12", name: "Name 12", description: "Description 12", isFavourite: false),
        EmojiModel(emoji: "Image 13", name: "Name 13", description: "Description 13", isFavourite: false)
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
         
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.title = "Emoji Reader"
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return emojis.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CustomTableViewCell
        let object = emojis[indexPath.row]
        cell.setup(object: object)
        return cell
    }
    
    
 
    
}
