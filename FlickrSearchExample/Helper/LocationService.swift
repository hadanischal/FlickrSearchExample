//
//  LocationService.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/25/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate {
    func tracingLocation(_ currentLocation: CLLocation)
    func tracingLocationDidFailWithError(_ error: Error)
}

class LocationService: NSObject, CLLocationManagerDelegate {
    
    static let sharedInstance = LocationService()
    var locationManager: CLLocationManager?
    var lastLocation: CLLocation?
    var delegate: LocationServiceDelegate?
    
    override init() {
        super.init()
        // setup locationManager
        self.locationManager = CLLocationManager()
        guard let locationManager = self.locationManager else {
            return
        }
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .denied:
            print("denied")
            break
        case .authorizedAlways:
            print("authorizedAlways")
            break
        default:
            break
        }
        locationManager.delegate = self
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
    }
    //showAlert("Location services were previously denied. Please enable location services for this app in Settings.")

    func startUpdatingLocation() {
        print("Starting Location Updates")
        self.locationManager?.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        print("Stop Location Updates")
        self.locationManager?.stopUpdatingLocation()
    }
    
    // CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        // singleton for get last location
        self.lastLocation = location
        // use for real time update location
        updateLocation(location)
        self.locationManager?.stopUpdatingLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // do on error
        updateLocationDidFailWithError(error)
    }
    
    // Private function
    private func updateLocation(_ currentLocation: CLLocation){
        guard let delegate = self.delegate else {
            return
        }
        delegate.tracingLocation(currentLocation)
    }
    
    private func updateLocationDidFailWithError(_ error: Error) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.tracingLocationDidFailWithError(error)
    }
}
