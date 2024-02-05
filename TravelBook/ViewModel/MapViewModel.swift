//
//  MapViewModel.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 4/2/24.
//

import Foundation
import CoreLocation
import GoogleMaps
import Firebase
import FirebaseStorage
@Observable
class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate, GMSMapViewDelegate {
    var buttonTappedCount = 0
    var showAlert = false
    var userLocation: CLLocationCoordinate2D?
    private var locationManager = CLLocationManager()
    var markers: [GMSMarker] = []
    var didLongPressAt: (String) -> Void = { _ in }
    override init() {
        super.init()
        setupLocationManager()
    }
    func buttonTapped() {
        buttonTappedCount += 1
        showAlert = true
    }
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 50
        locationManager.delegate = self
    }
    func addMarker(at coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: coordinate)
        markers.append(marker)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first?.coordinate else { return }
        userLocation = location
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Location error: \(error.localizedDescription)")
    }
    
    
   
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        print(coordinate.latitude)
        self.didLongPressAt("")
    }
}
