//
//  LocationService.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import CoreLocation

class LocationService: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?

    static var shared = LocationService()

    override  init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.stopUpdatingLocation()
    }

    func requestUserLocation(completion: () -> Void) {
        manager.requestWhenInUseAuthorization()
        completion()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locations = locations.last else {
            return

        }
        self.userLocation = locations
    }
}
