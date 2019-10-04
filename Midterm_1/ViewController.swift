//
//  ViewController.swift
//  Midterm_1
//
//  Created by Harrison Inocencio on 9/25/19.
//  Copyright © 2019 The Mappers. All rights reserved.
//

import UIKit
import Mapbox

class ViewController: UIViewController, MGLMapViewDelegate {
    @IBOutlet var mapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Change mapbox style
        mapView.styleURL = MGLStyle.satelliteStreetsStyleURL
        
        //Centering at the area around whitehall
        //mapView.setCenter(CLLocationCoordinate2D(latitude: 38.038039, longitude: -84.503953), zoomLevel: 16, animated: false)
        
        // Add point annotation (map marker)
        let annotation = MGLPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 38.038039, longitude: -84.503953)
        annotation.title = "Whitehall Classroom Building"
        annotation.subtitle = "Starting Position"
        mapView.addAnnotation(annotation)
        
        // Set mapView delegate
        mapView.delegate = self
        
        // Allow the map view to show user's location
        mapView.showsUserLocation = true
        
    }
        
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always allow callouts to popup when annotations are tapped.
        return true
    }
    
    func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
        let camera = MGLMapCamera(lookingAtCenter: annotation.coordinate, fromDistance: 4500, pitch: 15, heading: 180)
        mapView.fly(to: camera, withDuration: 4, peakAltitude: 3000, completionHandler: nil)
        
    }
        
}

