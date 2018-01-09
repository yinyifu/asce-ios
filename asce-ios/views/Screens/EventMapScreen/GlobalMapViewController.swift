//
//  GlobalMapView.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/8/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit
import MapKit
class GlobalMapViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var coverView: UIView!
    private var manager : CLLocationManager!
    private var heading : CLHeading?
    private var loc : CLLocation?;
    private var dest : CLLocation?;
    @IBOutlet weak var mapview: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager = CLLocationManager.init()
       self.manager.delegate = self;
        self.manager.startUpdatingLocation()
    }
    
    func initData(_ destinat : CLLocation){
        self.dest = destinat;
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard dest != nil else{
            return
        }
        if(self.heading != nil){
            self.mapview.camera.heading = self.heading!.trueHeading
            self.mapview.camera.pitch = 45
        }
        
        //let camera : MKMapCamera = MKMapCamera.init(lookingAtCenter: locations[0].coordinate, fromEyeCoordinate: eyecoor, eyeAltitude: 200)
        self.mapview.camera.centerCoordinate = locations[0].coordinate
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading
        newHeading: CLHeading) {
        guard dest != nil else{
            return
        }
        guard self.loc != nil else{
            return
        }
        
        
        self.mapview.camera.heading = newHeading.trueHeading;
        
    }
}
