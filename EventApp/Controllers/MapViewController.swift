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


class MapViewController: UIViewController, CLLocationManagerDelegate {
    
//    var activities: [Activity]?
    var activities = [Activity]()
    var mapAnnotations = [MapAnnotation]()
    private let locationManager = CLLocationManager()
    private var location: CLLocation?
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationButton: UIButton!
    
    
    // MARK: - View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        visualize()
        
        // TODO: Move to UI Test
        
        let testActivity1 = Activity(activityId: 12, type: "event", eventType: "beach-party", latitude: 37.328001, longitude: -122.038175, title: "Test Party 1", coverImage: "https://pbs.twimg.com/profile_images/586482256652308480/vzDYvxsY.jpg", venueTitle: nil, venueType: nil)
        
        let testActivity2 = Activity(activityId: 13, type: "venue", eventType: nil, latitude: 37.327131, longitude: -122.036415, title: "Happy Hours", coverImage: "http://s2.evcdn.com/images/block/I0-001/026/920/649-1.jpeg_/edm-reggae-beach-party-49.jpeg", venueTitle: "Laguna Disco Bar", venueType: "bar")
        
        let testActivity3 = Activity(activityId: 14, type: "event", eventType: "sport-event", latitude: 37.326355, longitude: -122.035734, title: "Full Moon Party", coverImage: "https://pbs.twimg.com/profile_images/586482256652308480/vzDYvxsY.jpg", venueTitle: "Other Disco Bar", venueType: "bar")
        
        let testActivity4 = Activity(activityId: 15, type: "venue", eventType: nil, latitude: 37.326479, longitude: -122.033591, title: "Cheers", coverImage: "http://s2.evcdn.com/images/block/I0-001/026/920/649-1.jpeg_/edm-reggae-beach-party-49.jpeg", venueTitle: "Cheers", venueType: "bar")
        
        let testActivity5 = Activity(activityId: 16, type: "venue", eventType: nil, latitude: 37.330377, longitude: -122.034426, title: "Apple Bar", coverImage: "http://s2.evcdn.com/images/block/I0-001/026/920/649-1.jpeg_/edm-reggae-beach-party-49.jpeg", venueTitle: "Apple Bar", venueType: "bar")
        
        activities.append(testActivity1!)
        activities.append(testActivity2!)
        activities.append(testActivity3!)
        activities.append(testActivity4!)
        activities.append(testActivity5!)
        
        createAnnotations()
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    // MARK: - View's Transition Handler
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Segues.showMapEvent {
            guard let vc = segue.destinationViewController as? EventViewController else { return }
            vc.parentNavColor = Colors.darkestBlue
        }
    }
    
    
    // MARK: - Class Functions
    
    func visualize() {
        locationButton.layer.cornerRadius = locationButton.frame.size.height / 2
        locationButton.addShadow(0.2, radius: 1.5)
    }
    
    func createAnnotations(){
        if activities.count > 0 {
            for activity in activities {
                mapAnnotations.append(MapAnnotation(activity: activity))
            }
            mapView.addAnnotations(mapAnnotations)
        }
    }
    
    
    // MARK: - Location Delegate Methods
    
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
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
        
        mapView.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()

        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: " + error.localizedDescription)
    }

    @IBAction func updateCurrentLocationPressed(sender: AnyObject) {
        setupLocationManager()
    }
}


extension MapViewController: MKMapViewDelegate {

    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            let pulseView = MKAnnotationView()
            pulseView.createCurrentUserLocation(pulseView)
            return pulseView
        }
        
        guard let annotation = annotation as? MapAnnotation else { return nil }
        
        let identifier = "pin"
        var view: MapAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MapAnnotationView {
            // Reuse Annotation
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // Create new annotation
            view = MapAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        return view
    }
    
    
    func seeEvent(sender: UITapGestureRecognizer) {
        if let view = sender.view as? MapAnnotationView {
            self.performSegueWithIdentifier(Segues.showMapEvent, sender: view.activityId)
        }
    }
    
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        if let view = view as? MapAnnotationView {
            updatePinPosition(view)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MapViewController.seeEvent))
            view.addGestureRecognizer(tapGesture)
        }
    }
    
    
    func mapView(mapView: MKMapView, didDeselectAnnotationView view: MKAnnotationView) {
        view.removeGestureRecognizer(view.gestureRecognizers!.first!)
        if let mapPin = view as? MapAnnotationView {
            if mapPin.preventDeselection {
                mapView.selectAnnotation(view.annotation!, animated: false)
            }
        }
    }
    
    
    func updatePinPosition(pin:MapAnnotationView) {
        let pinPosition = CGPoint(x: pin.frame.midX, y: pin.frame.maxY)
        
        let y = pinPosition.y + 50
        
        let controlPoint = CGPoint(x: (pinPosition.x+100), y: y)
        let controlPointCoordinate = mapView.convertPoint(controlPoint, toCoordinateFromView: mapView)
        
        mapView.setCenterCoordinate(controlPointCoordinate, animated: true)
    }
    
}
