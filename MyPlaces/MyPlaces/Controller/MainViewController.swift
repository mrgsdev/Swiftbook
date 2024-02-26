//
//  TableViewController.swift
//  MyPlaces
//
//  Created by mrgsdev on 24.02.2024.
//

import UIKit
import RealmSwift
class MainViewController: UITableViewController {
    
    var places: Results<Place>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        places = realm.objects(Place.self)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0 : places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.nameLabel.text = places[indexPath.row].name
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
        cell.imageOfPlace.image = UIImage(data: places[indexPath.row].imageData!)
        
        return cell
    }
    
    // MARK: - Navigation
    @IBAction func undwindSegue(_ segue:UIStoryboardSegue) {
        guard let newPlaceVC  = segue.source as? NewPlaceViewController else { return }
        newPlaceVC.saveNewPlace()
        tableView.reloadData()
    }
}
