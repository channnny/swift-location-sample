//
//  LocationService.swift
//  swift-location-sample
//
//  Created by ycsong on 2021/12/27.
//

import Foundation
import CoreLocation

class LocationService: NSObject {
    static let shared = LocationService()
    private override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
    var locationManager: CLLocationManager!
}

extension LocationService {
    func registLocation() {
        let location = CLLocationCoordinate2D(latitude: 37.4967867, longitude: 126.9978993)
        let region = CLCircularRegion(center: location,
                                              radius: 1.0,
                                              identifier: "id")
        
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        
        locationManager.startUpdatingLocation()
        locationManager.startMonitoring(for: region)
        print("region regist: \(region)")
    }
}

extension LocationService: CLLocationManagerDelegate {
    func requestAlwaysLocation() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
        case .authorizedAlways:
            registLocation()
        default:
            print("Location is not avaiable.")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        switch state {
        case .inside:
            print("들어왔습니다.")
        case .outside:
            print("나왔습니다.")
        case .unknown: break
            // do not something
        }
    }
}
