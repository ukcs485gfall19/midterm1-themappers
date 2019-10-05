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
    
    let map_center_coords = (38.030861, -84.504053)
    let r1_start_coords = (38.038366, -84.503865)
    let r1_end_coords = (38.039977, -84.503839)
    
    @IBAction func R1Tapped(_ sender: Any) {
        // Add start point (map marker)
        let r1_start = MGLPointAnnotation()
        r1_start.coordinate = CLLocationCoordinate2D(latitude: r1_start_coords.0, longitude: r1_start_coords.1)
        r1_start.title = "Whitehall Classroom Building"
        r1_start.subtitle = "Starting Position"
        mapView.addAnnotation(r1_start)
        
        // Add end point
        let r1_end = MGLPointAnnotation()
        r1_end.coordinate = CLLocationCoordinate2D(latitude: r1_end_coords.0, longitude: r1_end_coords.1)
        r1_end.title = "Gatton Student Center"
        r1_end.subtitle = "Ending Position"
        mapView.addAnnotation(r1_end)
        
        mapView.setCenter(CLLocationCoordinate2D(latitude: r1_start_coords.0, longitude: r1_start_coords.1), zoomLevel: 15, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Change mapbox style
        mapView.styleURL = MGLStyle.satelliteStreetsStyleURL
        
        // Set map center and zoom
        mapView.setCenter(CLLocationCoordinate2D(latitude: map_center_coords.0, longitude: map_center_coords.1), zoomLevel: 15, animated: false)
        
        // Set mapView delegate
        mapView.delegate = self
        
        // Allow the map view to show user's location
        mapView.showsUserLocation = true
        
    }
        
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always allow callouts to popup when annotations are tapped.
        return true
    }
    
    func mapView(_ mapView: MGLMapView, didSelect r1_start:MGLAnnotation) {
        let camera = MGLMapCamera(lookingAtCenter: r1_start.coordinate, fromDistance: 4500, pitch: 15, heading: 180)
        mapView.fly(to: camera, withDuration: 4, peakAltitude: 3000, completionHandler: nil)
    }
}

