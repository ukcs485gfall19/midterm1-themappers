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
        
        // Add point annotation (map marker)
        let annotation = MGLPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 40.77014, longitude: -73.97480)
        annotation.title = "Central Park"
        annotation.subtitle = "Biggest park in New York City!"
        mapView.addAnnotation(annotation)
        
        // Set mapView delegate
        mapView.delegate = self
        
    }


}

