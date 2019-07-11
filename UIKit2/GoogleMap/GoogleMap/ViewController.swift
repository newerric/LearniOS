//
//  ViewController.swift
//  GoogleMap
//
//  Created by mikewang on 2019/7/11.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    //Bloomsbury, London WC1B 3DE英國
    // 51.519794
    // -0.126871
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 51.519794, longitude: -0.126871, zoom: 12.0)
        mapView.camera = camera
        mapView.mapType = .satellite
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 51.519794, longitude: -0.126871)
        marker.map = mapView
        marker.title = "大英博物館"
        marker.snippet = "London"
        marker.icon = GMSMarker.markerImage(with: .green)
        
        mapView.delegate = self
    }
    
    // MARK: - GMSMapView
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        performSegue(withIdentifier: "showPano", sender: nil)
    }


}

