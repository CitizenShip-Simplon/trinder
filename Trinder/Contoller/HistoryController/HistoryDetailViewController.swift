//
//  HistoryDetailViewController.swift
//  Trinder
//
//  Created by Caroline Zaini on 07/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import UIKit
import MapKit

class HistoryDetailViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
   
   
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var itemsOfSection: UIImage!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var iconTrash: UIImageView!
    
    var decheteriesLocation = DecheteryCollection()
    let currentLocation = CLLocation(latitude: 48.854697, longitude: 2.435986)
    let distanceSpan: CLLocationDistance = 8000
    
   
    var imageArray: [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        addShadow()
        style()
        createAnnotations(locations: decheteriesLocation.dechetteriesLocations)
        zoomLevel(location: currentLocation)
      
    }
    
    func createAnnotations(locations:[[String : Any]]) {
        for locations in locations {
            let annotations = MKPointAnnotation()
            annotations.title = locations["name"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: locations["latitude"] as! CLLocationDegrees, longitude: locations["longitude"] as! CLLocationDegrees)
            
            mapView.addAnnotation(annotations)
        }
    }
    
    func zoomLevel(location: CLLocation) {
        let mapCoordinates = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan)
        mapView.setRegion(mapCoordinates, animated: true)
    }

    
    private func addShadow() {
        guard let view = backgroundView else { return }
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 2.0
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 10
    }
    
    private func style() {
         guard let productImage = itemsOfSection else { return }
//        productImage.layer.cornerRadius = 10
//        productImage.clipsToBounds = true
//    }
        
   
   
        
        
    }
}









  


