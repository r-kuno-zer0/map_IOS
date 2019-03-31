//
//  ViewController.swift
//  MyMap
//
//  Created by 久野　亮 on 2017/09/06.
//  Copyright © 2017年 久野　亮. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate{

    let manager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    var isPinAdded :Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            manager.requestWhenInUseAuthorization()
        }
        
    }
    
    
    func locationManager(_ manager: CLLocationManager,
            didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]){
        print("location : \(locations)")
        let current = locations[0]
        let region = MKCoordinateRegionMakeWithDistance(current.coordinate,
                                                        500, 500);
        mapView.setRegion(region, animated: true)
        
        if isPinAdded == false{
        let myLat: CLLocationDegrees = current.coordinate.latitude
        let myLon: CLLocationDegrees = current.coordinate.longitude
        let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLat, myLon)
        let annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
         // Do any additional setup after loading the view, typically from a nib.
            isPinAdded = true
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        print("error = \(error)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

}

