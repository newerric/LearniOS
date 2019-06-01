//
//  ViewController.swift
//  CLLocationManager
//
//  Created by mikewang on 2019/5/29.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.activityType = .automotiveNavigation
        locationManager?.startUpdatingLocation()
        
        if let coordinate = locationManager?.location?.coordinate {
            let xScale:CLLocationDegrees = 0.01
            let yScale:CLLocationDegrees = 0.01
            let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            map.setRegion(region, animated: true)
        }
        
        map.userTrackingMode = .followWithHeading
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        locationManager?.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("---------------------------------------")
        print(locations[0].coordinate.latitude)
        print(locations[0].coordinate.longitude)
    }


}

