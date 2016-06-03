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
import Haneke


class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
//    var activities : [Activity]?
    var activities = [Activity]()
    var mapAnnotations = [MapAnnotation]()
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        
        
        let testActivity1 = Activity(activityId: 12, type: "event", eventType: "beachParty", latitude: 37.328001, longitude: -122.038175, title: "Test Party 1", coverImage: "https://pbs.twimg.com/profile_images/586482256652308480/vzDYvxsY.jpg", venueTitle: nil, venueType: nil)
        
        let testActivity2 = Activity(activityId: 13, type: "venue", eventType: nil, latitude: 37.327131, longitude: -122.036415, title: "Happy Hours", coverImage: "http://s2.evcdn.com/images/block/I0-001/026/920/649-1.jpeg_/edm-reggae-beach-party-49.jpeg", venueTitle: "Laguna Disco Bar", venueType: "bar")
        
        let testActivity3 = Activity(activityId: 14, type: "event", eventType: nil, latitude: 37.326355, longitude: -122.035734, title: "Full Moon Party", coverImage: "https://pbs.twimg.com/profile_images/586482256652308480/vzDYvxsY.jpg", venueTitle: "Other Disco Bar", venueType: "bar")
        
        let testActivity4 = Activity(activityId: 15, type: "venue", eventType: nil, latitude: 37.326479, longitude: -122.033591, title: "Cheers", coverImage: "http://s2.evcdn.com/images/block/I0-001/026/920/649-1.jpeg_/edm-reggae-beach-party-49.jpeg", venueTitle: "Cheers", venueType: "bar")
        
        let testActivity5 = Activity(activityId: 16, type: "venue", eventType: nil, latitude: 37.330377, longitude: -122.034426, title: "Apple Bar", coverImage: "http://s2.evcdn.com/images/block/I0-001/026/920/649-1.jpeg_/edm-reggae-beach-party-49.jpeg", venueTitle: "Apple Bar", venueType: "bar")
        
        activities.append(testActivity1!)
        activities.append(testActivity2!)
        activities.append(testActivity3!)
        activities.append(testActivity4!)
        activities.append(testActivity5!)
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        visualize()
    }
    
    
    func visualize() {
        createAnnotations()
    }
    
    // MARK: Manage Memory
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: View's Transition Handler
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //TODO: send activityId to activity view
    }
    
    // MARK: Convert Activities to Annotations
    
    func createAnnotations(){
        if activities.count > 0 {
            for activity in activities {
                mapAnnotations.append(MapAnnotation(activity: activity))
            }
            mapView.addAnnotations(mapAnnotations)
            print(mapAnnotations.count)
        }
    }
    
    // MARK: Location Delegate Methods
    
    func setupLocationManager() {
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
        
        mapView.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: " + error.localizedDescription)
    }

}

extension MapViewController {
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            let pulseView = MKAnnotationView()
            pulseView.centerOffset = CGPoint(x: 50, y: -30)
            
            let subview1 = UIView()
            let pulsator = Pulsator()
            pulsator.backgroundColor = Colors.mainBlueHalf.CGColor
            pulsator.numPulse = 6
            pulsator.animationDuration = 12
            pulsator.repeatCount = 5
            pulsator.radius = 200.0
            pulsator.start()
            subview1.layer.addSublayer(pulsator)
            subview1.frame.offsetInPlace(dx: 14.5, dy: 14.5)
            
            let subview2 = UIImageView(image: UIImage(named: "userLocation"))
            subview2.frame = CGRectMake(0, 0, 30, 30)
            subview2.contentMode = .ScaleAspectFit
            
            pulseView.addSubview(subview2)
            pulseView.insertSubview(subview1, belowSubview: subview2)
            return pulseView
        }
        
        if let annotation = annotation as? MapAnnotation {
            let identifier = "pin"
            var view : MKAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) {
                //
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // Create new annotation
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                
                // Determine map icon
                if annotation.type == "event" {
                    view.image = UIImage(named: "downArrow")
                    
                } else {
                    switch annotation.venueType! {
                        case "bar":
                            view.image = UIImage(named: "downArrow")
                        case "club":
                            view.image = UIImage(named: "downArrow")
                        case "sportsbar":
                            view.image = UIImage(named: "downArrow")
                        default: break
                    }
                }
                view.canShowCallout = true
                view.backgroundColor = Colors.mainDarkHalf
            }
            configureDetailView(view)
            return view
        }
        return nil
    }
    
    func configureDetailView(annotationView: MKAnnotationView) {
        let width = 300
        let height = 180
        
        let urlString = NSURL(string: "http://s2.evcdn.com/images/block/I0-001/026/920/649-1.jpeg_/edm-reggae-beach-party-49.jpeg")
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView.hnk_setImageFromURL(urlString!)
        imageView.contentMode = .ScaleAspectFill
        
        annotationView.detailCalloutAccessoryView = imageView
    }
    
}
