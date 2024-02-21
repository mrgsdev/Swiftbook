//
//  TableViewController.swift
//  TableView&CollectionVIew
//
//  Created by mrgsdev on 20.02.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    var emojis = [
        EmojiModel(emoji: "🤨", name: "Name 1", description: "Description 1", isFavourite: false),
        EmojiModel(emoji: "🧐", name: "Name 2", description: "Description 2", isFavourite: false),
        EmojiModel(emoji: "😎", name: "Name 3", description: "Description 3", isFavourite: false),
        EmojiModel(emoji: "🫤", name: "Name 4", description: "Description 4", isFavourite: false),
        EmojiModel(emoji: "🫥", name: "Name 5", description: "Description 5", isFavourite: false),
        EmojiModel(emoji: "🤔", name: "Name 6", description: "Description 6", isFavourite: false),
        EmojiModel(emoji: "🤩", name: "Name 7", description: "Description 7", isFavourite: false),
        EmojiModel(emoji: "😡", name: "Name 8", description: "Description 8", isFavourite: false),
        EmojiModel(emoji: "🤭", name: "Name 9", description: "Description 9", isFavourite: false),
        EmojiModel(emoji: "🤓", name: "Name 10", description: "Description 10", isFavourite: false),
        EmojiModel(emoji: "🤥", name: "Name 11", description: "Description 11", isFavourite: false),
        EmojiModel(emoji: "😫", name: "Name 12", description: "Description 12", isFavourite: false),
        EmojiModel(emoji: "😳", name: "Name 13", description: "Description 13", isFavourite: false)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.title = "Emoji Reader"
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        guard segue.identifier == "saveSegue" else {return}
        let sourceVC = segue.source as! NewEmojiTableViewController // source с которого мы переходим /
        let emoji = sourceVC.emoji
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            emojis[selectedIndexPath.row] = emoji
            tableView.reloadRows(at:[ selectedIndexPath], with: .fade)
        } else{
            
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            
            emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .fade)
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "editEmoji" else { return }
        let indexPath = tableView.indexPathForSelectedRow!
        let emoji = emojis[indexPath.row]
        let navVC = segue.destination as! UINavigationController
        let newEmojiVC = navVC.topViewController as! NewEmojiTableViewController
        newEmojiVC.emoji = emoji
        newEmojiVC.title = "Edit"
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
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete //insert +
    }
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(moveEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let doneAction = doneAction(at: indexPath)
        let heartAction = heartAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [doneAction,heartAction])
    }
    func doneAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "") { action, view, completion in
            self.emojis.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        action.backgroundColor = .green
        action.image = UIImage(named: "Close")
        return action
    }
    func heartAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "") { action, view, completion in
            self.emojis[indexPath.row].isFavourite = !self.emojis[indexPath.row].isFavourite
            print(self.emojis)
            completion(true)
        }
        if self.emojis[indexPath.row].isFavourite {
            action.image = UIImage(named: "HeartFilled")
            action.backgroundColor = .systemGray
        } else{
            action.image = UIImage(named: "Heart")
            action.backgroundColor = .green
        }
        return action
    }
    
}


