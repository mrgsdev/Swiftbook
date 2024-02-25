//
//  TableViewController.swift
//  MyPlaces
//
//  Created by mrgsdev on 24.02.2024.
//

import UIKit

class MainViewController: UITableViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//       return places.count
//    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let radius = cell.imageOfPlace.frame.size.height / 2
//        let place = places[indexPath.row]
        cell.imageOfPlace.layer.cornerRadius = radius
        
//        cell.nameLabel.text = place.name
//        cell.locationLabel.text = place.location
//        cell.typeLabel.text = place.type
//        
//        if place.image == nil {
//            cell.imageOfPlace.image = UIImage(named: places[indexPath.row].restaurantImage!)
//        } else{
//            cell.imageOfPlace.image = place.image
//        }
        return cell
    }
   
    // MARK: - Navigation
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
  
    @IBAction func undwindSegue(_ segue:UIStoryboardSegue) {
        guard let newPlaceVC  = segue.source as? NewPlaceViewController else {
            return
        }
        
        newPlaceVC.saveNewPlace()
//        places.append(newPlaceVC.newPlace!)
        tableView.reloadData()
    }
}
