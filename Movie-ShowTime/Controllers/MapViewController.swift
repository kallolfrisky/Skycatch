//
//  MapViewController.swift
//  Movie-ShowTime
//
//  Created by Najmul Hasan on 12/27/17.
//  Copyright © 2017 Najmul Hasan. All rights reserved.
//

import Foundation
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    public var location: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coordinates(forAddress: String.init(format: "%@, San Francisco, CA", location)) {
            (location) in
            guard let location = location else {
                // Handle error here.
                print("Invalid location")
                return
            }
            self.openMapForPlace(location: location)
        }
    }
    
    func openMapForPlace(location: CLLocationCoordinate2D){
        
        var region = MKCoordinateRegion()
        region.center = location
        region.span = MKCoordinateSpanMake(0.05, 0.05)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
    }
    
    func coordinates(forAddress address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {
            (placemarks, error) in
            guard error == nil else {
                print("Geocoding error: \(error!)")
                completion(nil)
                return
            }
            completion(placemarks?.first?.location?.coordinate)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
