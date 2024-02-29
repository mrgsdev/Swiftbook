//
//  MapViewController.swift
//  MyPlaces
//
//  Created by mrgsdev on 28.02.2024.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var place = Place()
    let annotationID = "annotationID"
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setupPlacemark()
    }
    
    @IBAction func closeVC(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    private func setupPlacemark(){
        guard let location = place.location else { return }
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
            annotatition.title = self.place.name
            annotatition.subtitle = self.place.type
            
            guard let placemarkLocation = placemark?.location else { return }
            annotatition.coordinate = placemarkLocation.coordinate
            
            self.mapView.showAnnotations([annotatition], animated: true)
            self.mapView.selectAnnotation(annotatition, animated: true)
            
        }
        
    }
}


extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationID) as? MKPinAnnotationView
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationID)
            annotationView?.canShowCallout = true
        }
        
        if let imageData = place.imageData {
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            imageView.image = UIImage(data: imageData)
            annotationView?.rightCalloutAccessoryView = imageView
        }
        return annotationView
        
    }
}
