//
//  LocationInterator.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/12.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import CoreLocation

class LocationInterator: NSObject {
    private let locationManager = CLLocationManager()
    private(set) var currentLocation: CLLocation?
    public weak var delegate: LocationInteractorDelegate?
    public func requestLocationAuthorizationIfNeeded() {
        locationManager.delegate = self
    
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted:
                locationManager.requestWhenInUseAuthorization()
            case .denied:
                createPermissionAlert()
            case .authorizedAlways, .authorizedWhenInUse:
                startManagingLocation()
            }
        } else {
            createLocationAlert()
        }
    }
    
    func startManagingLocation() {
        delegate?.deviceIsLoadingLocation()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.startUpdatingLocation()
    }
    
    public func stopManagingLocation(){
        locationManager.delegate = nil
        locationManager.stopUpdatingLocation()
    }
    
    private func createPermissionAlert() {
        let title = "Privacy Warning!"
        let message  = "You must grant Weather permissions to use location services."
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Open settings",style: .default) { (UIAlertAction) in
            let url = URL.init(string: UIApplicationOpenSettingsURLString)
            UIApplication.shared.open(url!, options: [String : Any](), completionHandler:nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertViewController, animated: true, completion: nil)
    }
    
    private func createLocationAlert() {
        let title = "Privacy Warning!"
        let message  = "Location services are turned off on this device. To use Weather you must enabled location services."
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Open settings", style: .default) { (UIAlertAction) in
            UIApplication.shared.open(URL(string:"App-Prefs:root=Privacy&path=LOCATION")!, options: [:], completionHandler: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertViewController, animated: true, completion: nil)
    }
    
    private func isLocationValid(location: CLLocation) -> Bool {
        return !(location.coordinate.latitude == 0 || location.coordinate.longitude == 0 )
    }
    
    private func validateLocationChange(_ location: CLLocation) -> Bool {
        let point = CLLocation.init(latitude: location.coordinate.latitude, longitude:location.coordinate.longitude)
        if isLocationValid(location: location)==false {
            return false
        }
        guard let currentLocation = self.currentLocation else {
            return true
        }
        return point.distance(from: currentLocation) > LocationContants.constantWeatherRadiusInMeters
    }
}

extension LocationInterator: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        ThreadDispatcher.runOnMain {
            self.requestLocationAuthorizationIfNeeded()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return 
        }
        if validateLocationChange(location) {
            currentLocation = location
            delegate?.userLocationChanged(location: location)
        }
    }
}
