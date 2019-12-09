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
    
    var imagePassed = UIImage()
    var iconTrashPassed = UIImage()
    
    var decheteriesCollection = DecheteryCollection()
    let regionInMeters: Double = 10000
    let distanceSpan: CLLocationDistance = 8000
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        addShadow()
        animateIcon()
        createAnnotations(locations: decheteriesCollection.dechetteriesLocations)
        checkLocationService()
    }
       
    private func setupImageView() {
        itemsOfSection.image = imagePassed
//        iconTrash.image = iconTrashPassed
    }

    private func addShadow() {
        guard let view = backgroundView else { return }
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 2.0
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view.layer.shadowOpacity = 0.5
    }
    
    func animateIcon() {
        UIView.animate(withDuration: 0.2, animations:  {
            self.iconTrash.frame.size.width += 10
            self.iconTrash.frame.size.height += 10
        }) { _ in
            UIView.animate(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                self.iconTrash.frame.origin.y -= 10
            })
        }
    }
        


    
// MARK:- map's methods
    
    func createAnnotations(locations:[[String : Any]]) {

        for locations in locations {
            let annotations = MKPointAnnotation()
            annotations.title = locations["name"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: locations["latitude"] as! CLLocationDegrees, longitude: locations["longitude"] as! CLLocationDegrees)
            annotations.subtitle = locations["description"] as? String
          
            mapView.addAnnotation(annotations)
          
        }
    }
    
    func zoomLevel() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
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









  


