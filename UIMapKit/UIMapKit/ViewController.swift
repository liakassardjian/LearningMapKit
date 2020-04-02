//
//  ViewController.swift
//  UIMapKit
//
//  Created by Lia Kassardjian on 02/04/20.
//  Copyright © 2020 Lia Kassardjian. All rights reserved.
//

import UIKit
import MapKit

protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManagerDelegate: LocationManagerDelegate?
    var mapSearchDelegate: MapSearchDelegate?
    
    var resultSearchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLocationManager()
        setSearchController()
        setSearchBar()
    }
    
    private func setLocationManager() {
        locationManagerDelegate = LocationManagerDelegate(vC: self)
        locationManagerDelegate?.setUp()
    }
    
    private func setSearchController() {
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTable
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable as UISearchResultsUpdating
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        
        locationSearchTable.mapView = mapView
        
        mapSearchDelegate = MapSearchDelegate(vC: self)
        locationSearchTable.handleMapSearchDelegate = mapSearchDelegate
    }
    
    private func setSearchBar() {
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.searchController = resultSearchController
    }
}

