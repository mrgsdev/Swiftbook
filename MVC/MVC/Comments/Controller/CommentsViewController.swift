//
//  ViewController.swift
//  MVC
//
//  Created by mrgsdev on 19.03.2024.
//

import UIKit

class CommentsViewController: UIViewController {
    
     
    @IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .red
        CommentNetworkService.getComments { (response) in
            self.comments = response.comments
            
        }
    }


}


extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as! CommentCell
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        self.tableView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
}

extension CommentsViewController: UITableViewDelegate{}
