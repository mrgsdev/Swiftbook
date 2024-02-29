//
//  MapViewController.swift
//  MyPlaces
//
//  Created by mrgsdev on 28.02.2024.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var place: Place?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlacemark()
    }
    
    @IBAction func closeVC(_ sender: UIButton) {
        dismiss(animated: true)
    }

    
    private func setupPlacemark(){
        guard let location = place!.location else { return }
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { placemarks, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let placemarks = placemarks else { return }
            
            let placemark = placemarks.first
            print(placemark!)
            let annotatition = MKPointAnnotation()
            annotatition.title = self.place?.name
            annotatition.subtitle = self.place?.type
            
            guard let placemarkLocation = placemark?.location else { return }
            annotatition.coordinate = placemarkLocation.coordinate
            
            self.mapView.showAnnotations([annotatition], animated: true)
            self.mapView.selectAnnotation(annotatition, animated: true)
            
        }
        
    }
}
