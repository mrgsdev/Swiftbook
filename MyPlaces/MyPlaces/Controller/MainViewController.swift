//
//  TableViewController.swift
//  MyPlaces
//
//  Created by mrgsdev on 24.02.2024.
//

import UIKit
import RealmSwift
class MainViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var places: Results<Place>!
    override func viewDidLoad() {
        super.viewDidLoad()
        places = realm.objects(Place.self)
    }
    
    
    
    
}

extension MainViewController{
    // MARK: - Navigation
    @IBAction func undwindSegue(_ segue:UIStoryboardSegue) {
        guard let newPlaceVC  = segue.source as? NewPlaceViewController else { return }
        newPlaceVC.savePlace()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let place = places[indexPath.row]
            let newPlaceVC = segue.destination as! NewPlaceViewController
            newPlaceVC.currentPlace = place
        }
    }
}
extension MainViewController: UITableViewDelegate,UITableViewDataSource{
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0 : places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.nameLabel.text = places[indexPath.row].name
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
        cell.imageOfPlace.image = UIImage(data: places[indexPath.row].imageData!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let place = places[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { _, _ in
            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
    
}
