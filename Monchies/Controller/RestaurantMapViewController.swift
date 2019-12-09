//
//  RestaurantMapViewController.swift
//  Monchies
//
//  Created by Dion Pettaway on 12/9/19.
//  Copyright © 2019 Dipet_Low. All rights reserved.
//

import UIKit
import MapKit

class RestaurantMapViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  var restaurant = Restaurant()


    override func viewDidLoad() {
        super.viewDidLoad()
      
      navigationController?.navigationBar.tintColor = .black
      
      let geoCoder = CLGeocoder()
      geoCoder.geocodeAddressString(restaurant.location, completionHandler:
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

        // Do any additional setup after loading the view.
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
