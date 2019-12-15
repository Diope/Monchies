//
//  RestaurantMapViewController.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/9/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit
import MapKit

class RestaurantMapViewController: UIViewController, MKMapViewDelegate {
  
  @IBOutlet weak var mapView: MKMapView!
  
  fileprivate let locationManager:CLLocationManager = CLLocationManager()
  var restaurant: RestaurantMO!
  var brandColor = UIColor(red: 0.004207400605, green: 0.8167108297, blue: 0.8440560699, alpha: 1)


    override func viewDidLoad() {
        super.viewDidLoad()
      
      mapView.delegate = self
      
      navigationController?.navigationBar.tintColor = .black
      
      let geoCoder = CLGeocoder()
      geoCoder.geocodeAddressString(restaurant.location ?? "", completionHandler:
      {
        placemarks, error in
          if let error = error {
            print(error)
            return
          }
        if let placemarks = placemarks {
          let placemark = placemarks[0]
          let annotation = MKPointAnnotation()
          annotation.title = self.restaurant.name
          annotation.subtitle = self.restaurant.type
          
          if let location = placemark.location {
            annotation.coordinate = location.coordinate
            
            // Display
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
          }
        }
      })
      
//      locationManager.requestWhenInUseAuthorization()
//      locationManager.desiredAccuracy = kCLLocationAccuracyBest
//      locationManager.distanceFilter = kCLDistanceFilterNone
//      locationManager.startUpdatingLocation()
    }
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let identifier = "mapMarker"
    
    if annotation.isKind(of: MKUserLocation.self) {
      return nil
    }
    
    var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
    
    if annotationView == nil {
      annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
    }
    annotationView?.glyphText = "🍽"
    annotationView?.markerTintColor = brandColor
    
    return annotationView
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
