//
//  ViewController.swift
//  map
//
//  Created by period3 on 5/25/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, UISearchBarDelegate {

    
    
    @IBOutlet weak var mapKit: MKMapView!
    
    var mpCoor = CLLocationCoordinate2D(latitude: 42.066418 , longitude: -87.937294)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapKit.mapType = .satellite
        mapKit.showsCompass = true
        mapKit.showsUserLocation = true
        mapKit.showsTraffic = true
        mapKit.showsBuildings = true
    }

}

