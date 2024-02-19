//
//  TrackListTVC.swift
//  Framework-UIKit
//
//  Created by mrgsdev on 19.02.2024.
//  UITableView + UIImage

import UIKit

class TrackListTVC: UITableViewController {
    
    let imageNameArray = [
        "The Beatles - Please Please Me",
        "The Beatles - With The Beatles",
        "The Beatles - A Hard Day's Night",
        "The Beatles - Beatles For Sale",
        "The Beatles - Help!",
        "The Beatles - Rubber Soul",
        "The Beatles - Revolver",
        "The Beatles - Sgt. Pepper's Lonely Hearts Club Band",
        "The Beatles - The Beatles",
        "The Beatles - Yellow Submarine",
        "The Beatles - Abbey Road",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNameArray.count // количество строк
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        cell.textLabel?.text = imageNameArray[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // размер cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTrack" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as? TrackViewController
                detailVC?.trackTitle = imageNameArray[indexPath.row]
            }
        }
    }
}
