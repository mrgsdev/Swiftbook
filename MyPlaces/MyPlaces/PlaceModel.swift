//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by mrgsdev on 24.02.2024.
//

import UIKit
import RealmSwift

class Place: Object {
    @objc dynamic var name: String?
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    
    let restaurantNames = [
        "Burger Heroes",
        "Kitchen",
        "Bonsai",
        "Дастархан",
        "Индокитай",
        "X.O",
        "Балкан Гриль",
        "Sherlock Holmes",
        "Speak Easy",
        "Morris Pub",
        "Вкусные истории",
        "Классик",
        "Love&Life",
        "Шок",
        "Бочка"
    ]
    
    func savePlaces() {
        
        for place in restaurantNames {
            
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else { return }
            
            let newPlace = Place()
            newPlace.name = place
            newPlace.location = "Ufa"
            newPlace.type = "Restaurant"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
        }
    }
}


//struct Place{
//    var name:String
//    var location:String?
//    var type:String?
//    var image:UIImage?
//    var restaurantImage:String?
//}
