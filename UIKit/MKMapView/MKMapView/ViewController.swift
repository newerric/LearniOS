//
//  ViewController.swift
//  MKMapView
//
//  Created by mikewang on 2019/5/28.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMap()
        
    }
    
    // MARK: - IBAction
    
    @IBAction func addMeAnnotation(_ sender: UILongPressGestureRecognizer) {
        let touchPoint = sender.location(in: map)
        let touchCoordinate:CLLocationCoordinate2D = map.convert(touchPoint, toCoordinateFrom: map)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = touchCoordinate
        annotation.title = "New Place"
        annotation.subtitle = "One day I wanna be here"
        
        map.addAnnotation(annotation)
    }
    
    // MARK: - Other Method
    
    private func initMap() {
        let latitude:CLLocationDegrees = 51.519634
        let longitude:CLLocationDegrees = -0.126989
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let xScale: CLLocationDegrees = 0.01
        let yScale: CLLocationDegrees = 0.01
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: xScale, longitudeDelta: yScale)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        //map.mapType = .satellite
    }
}

