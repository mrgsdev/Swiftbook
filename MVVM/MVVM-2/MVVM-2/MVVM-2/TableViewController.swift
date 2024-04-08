//
//  TableViewController.swift
//  MVVM-2
//
//  Created by mrgsdev on 08.04.2024.
//

import UIKit

class TableViewController: UITableViewController {

    var profiles: [Profile]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profiles = [
            Profile(name: "John", secondName: "Smith", age: 33),
            Profile(name: "Max", secondName: "Kolvy", age: 21),
            Profile(name: "Mark", secondName: "Salmon", age: 52)
        ]
    }

    // MARK: - Table view data source
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let profiles else { return 0 }
        return profiles.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        guard let profiles, let cell else { return UITableViewCell()}
        let profile = profiles[indexPath.row]
        
        cell.ageLabel.text = String(describing: profile.age)
        cell.nameLabel.text = profile.name
        cell.secondNameLabel.text = profile.secondName

        return cell
    }
 


}
