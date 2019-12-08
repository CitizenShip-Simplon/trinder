//
//  HistoryDetailViewController.swift
//  Trinder
//
//  Created by Caroline Zaini on 07/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HistoryDetailViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
   
   
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var itemsOfSection: UIImageView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var iconTrash: UIImageView!
    
    var image: [UIImage]!
    var selectedImage: String!
    
    var decheteriesCollection = DecheteryCollection()
    let regionInMeters: Double = 10000
    let distanceSpan: CLLocationDistance = 8000
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        addShadow()
        createAnnotations(locations: decheteriesCollection.dechetteriesLocations)
        checkLocationService()
      
    }
    

    
    private func setupImageView() {
        
        }

    
        private func addShadow() {
            guard let view = backgroundView else { return }
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowRadius = 2.0
            view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            view.layer.shadowOpacity = 0.5
//            view.layer.cornerRadius = 10
        }
        


    
    
    func createAnnotations(locations:[[String : Any]]) {
        for locations in locations {
            let annotations = MKPointAnnotation()
            annotations.title = locations["name"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: locations["latitude"] as! CLLocationDegrees, longitude: locations["longitude"] as! CLLocationDegrees)
            
            mapView.addAnnotation(annotations)
        }
    }
    
    func zoomLevel() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    // Two methodes for the user location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    func checkLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            /// Show alert letting the user they have to turn this on
        }
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        /// When the app is open
        case .authorizedWhenInUse:
            /// for see the blue location
            mapView.showsUserLocation = true
            zoomLevel()
            locationManager.startUpdatingLocation()
     
        /// Show alert instructing them how to turn on permissions with plist
        case .denied:
            break
        case .notDetermined:
            /// When it's not determined, we have permission
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
        /// Show alert instructing themletting them how what's up
        break
        /// When the app is on the background
        case .authorizedAlways:
            break
            
        default:
            break
        }
    }

    
}









  


