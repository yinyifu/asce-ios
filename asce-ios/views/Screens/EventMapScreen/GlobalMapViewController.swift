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
    var dest : CLLocation?;
    var hisLocation : MKMapItem?;
    //var locationTuples : [(textField : UITextField?, mapItem : MKMapItem?)]!
    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var authorizationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let display = UIImage.init(cgImage: (UIImage.init(named: "door")?.cgImage)!, scale: 1.7, orientation: UIImageOrientation.down)
        
        self.tabBarItem.image = display
        
        self.manager = CLLocationManager.init()
        self.manager.delegate = self;
        self.manager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            self.manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            self.manager.startUpdatingLocation()
            self.mapview.camera.altitude = 1000
            
        }
        let stat = CLLocationManager.authorizationStatus()
        
        self.hideLabelOnStatus(status: stat)
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.hideLabelOnStatus(status: status)
    }
    func hideLabelOnStatus(status : CLAuthorizationStatus){
        if(status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse){
            self.authorizationLabel.isHidden = true;
        }
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
        
        self.mapview.camera.centerCoordinate = dest!.coordinate
       
        self.coverView.isHidden = true;
        CLGeocoder().reverseGeocodeLocation(locations.last!) {(placemarks:[CLPlacemark]?, error:Error?) in
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                self.hisLocation = MKMapItem.init(placemark: MKPlacemark.init(coordinate: placemark.location!.coordinate, addressDictionary: placemark.addressDictionary as! [String : Any]))
                
                
                
            }
        };
    }
    
    func formatAddressFromPlacemark(placemark: CLPlacemark) -> String {
        return (placemark.addressDictionary!["FormattedAddressLines"] as!
            [String]).joined(separator: ", ")
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
