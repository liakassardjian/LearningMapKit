//
//  ViewController.swift
//  UIMapKit
//
//  Created by Lia Kassardjian on 02/04/20.
//  Copyright © 2020 Lia Kassardjian. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManagerDelegate: LocationManagerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManagerDelegate = LocationManagerDelegate(vC: self)
        locationManagerDelegate?.setUp()
    }


}

