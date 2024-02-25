//
//  TableViewController.swift
//  MyPlaces
//
//  Created by mrgsdev on 24.02.2024.
//

import UIKit

class MainViewController: UITableViewController {
    let places = [
        Place(image: "Burger Heroes", name: "Burger Heroes", location: "location", type: "type"),
        Place(image: "Kitchen", name: "Kitchen", location: "location", type: "type"),
        Place(image: "Bonsai", name: "Bonsai", location: "location", type: "type"),
        Place(image: "Дастархан", name: "Дастархан", location: "location", type: "type"),
        Place(image: "Индокитай", name: "Индокитай", location: "location", type: "type"),
        Place(image: "X.O", name: "X.O", location: "location", type: "type"),
        Place(image: "Балкан Гриль", name: "Балкан Гриль", location: "location", type: "type"),
        Place(image: "Sherlock Holmes", name: "Sherlock Holmes", location: "location", type: "type"),
        Place(image: "Speak Easy", name: "Speak Easy", location: "location", type: "type"),
        Place(image: "Morris Pub", name: "Morris Pub", location: "location", type: "type"),
        Place(image: "Вкусные истории", name: "Вкусные истории", location: "location", type: "type"),
        Place(image: "Классик", name: "Классик", location: "location", type: "type"),
        Place(image: "Love&Life", name: "Love&Life", location: "location", type: "type"),
        Place(image: "Шок", name: "Шок", location: "location", type: "type"),
        Place(image: "Бочка", name: "Бочка", location: "location", type: "type")
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
        
        cell.imageOfPlace.image = UIImage(named: places[indexPath.row].image!)
        return cell
    }
   
    // MARK: - Navigation
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
  
    @IBAction func cancelAction(_ segue:UIStoryboardSegue) {}
}
