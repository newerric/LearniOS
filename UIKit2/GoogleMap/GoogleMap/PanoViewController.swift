//
//  PanoViewController.swift
//  GoogleMap
//
//  Created by mikewang on 2019/7/11.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit
import GoogleMaps

class PanoViewController: UIViewController {
    
    //Bloomsbury, London WC1B 3DE英國
    // 51.519794
    // -0.126871
    
    @IBOutlet weak var panoView: GMSPanoramaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSPanoramaService().requestPanoramaNearCoordinate(CLLocationCoordinate2D(latitude: 51.519794, longitude: -0.126871)) {
            (pano, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            self.panoView.panorama = pano
        }        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
