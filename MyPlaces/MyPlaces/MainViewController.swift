//
//  TableViewController.swift
//  MyPlaces
//
//  Created by mrgsdev on 24.02.2024.
//

import UIKit

class MainViewController: UITableViewController {
    var places = [ 
        Place(restaurantImage: "Burger Heroes", image: nil, name: "Burger Heroes", location: "location", type: "type"),
        Place(restaurantImage: "Kitchen",  image: nil,name: "Kitchen", location: "location", type: "type"),
        Place(restaurantImage: "Bonsai",  image: nil,name: "Bonsai", location: "location", type: "type"),
        Place(restaurantImage: "Дастархан",  image: nil,name: "Дастархан", location: "location", type: "type"),
        Place(restaurantImage: "Индокитай",  image: nil,name: "Индокитай", location: "location", type: "type"),
        Place(restaurantImage: "X.O",  image: nil,name: "X.O", location: "location", type: "type"),
        Place(restaurantImage: "Балкан Гриль", image: nil, name: "Балкан Гриль", location: "location", type: "type"),
        Place(restaurantImage: "Sherlock Holmes",  image: nil,name: "Sherlock Holmes", location: "location", type: "type"),
        Place(restaurantImage: "Speak Easy", image: nil, name: "Speak Easy", location: "location", type: "type"),
        Place(restaurantImage: "Morris Pub", image: nil, name: "Morris Pub", location: "location", type: "type"),
        Place(restaurantImage: "Вкусные истории", image: nil, name: "Вкусные истории", location: "location", type: "type"),
        Place(restaurantImage: "Классик", image: nil, name: "Классик", location: "location", type: "type"),
        Place(restaurantImage: "Love&Life",  image: nil,name: "Love&Life", location: "location", type: "type"),
        Place(restaurantImage: "Шок",  image: nil,name: "Шок", location: "location", type: "type"),
        Place(restaurantImage: "Бочка",  image: nil, name: "Бочка", location: "location", type: "type")
    ]

  


    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let radius = cell.imageOfPlace.frame.size.height / 2
        let place = places[indexPath.row]
        cell.imageOfPlace.layer.cornerRadius = radius
        
        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        
        if place.image == nil {
            cell.imageOfPlace.image = UIImage(named: places[indexPath.row].restaurantImage!)
        } else{
            cell.imageOfPlace.image = place.image
        }
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
        places.append(newPlaceVC.newPlace!)
        tableView.reloadData()
    }
}
