//
//  MapSearchDelegate.swift
//  UIMapKit
//
//  Created by Lia Kassardjian on 02/04/20.
//  Copyright © 2020 Lia Kassardjian. All rights reserved.
//

import Foundation
import MapKit

class MapSearchDelegate: HandleMapSearch {
    
    weak var viewController: ViewController?
    var selectedPin: MKPlacemark?
    
    init(vC: ViewController) {
        self.viewController = vC
    }
    
    func dropPinZoomIn(placemark: MKPlacemark) {
        selectedPin = placemark
        
        guard let mapView = viewController?.mapView else { return }
        
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if
            let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "\(city), \(state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}
