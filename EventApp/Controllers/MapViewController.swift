//
//  MapViewController.swift
//  EventApp
//
//  Created by Michael Darche on 4/21/16.
//  Copyright © 2016 Michael Darche. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let pulsator = Pulsator()
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
        setupLocationManager()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    func visualize() {
//        let size = CGSize(width: UIScreen.mainScreen().bounds.width, height: 25)
//        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
//        let statusBarBG = UIView(frame: rect)
//        statusBarBG.backgroundColor = UIColor(red: 43/255, green: 49/255, blue: 63/255, alpha: 1.0)
//        
//        statusBarBG.layer.shadowColor = UIColor.blackColor().CGColor
//        statusBarBG.layer.shadowOffset = CGSize(width: 0, height: 5)
//        statusBarBG.layer.shadowOpacity = 0.2
//        statusBarBG.layer.shadowRadius = 4
//        
//        self.view.addSubview(statusBarBG)
//        statusBarBG.alpha = 0.90
    }
    
    // MARK: Manage Memory
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Location Delegate Methods
    
    func setupLocationManager() {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15))
        
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: " + error.localizedDescription)
    }

}
