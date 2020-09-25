//
//  CategoryMapVC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 08/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit
import MapKit

class CategoryMapVC: UIViewController {
    
    //MARK:- OUTLET
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK:- PROPERTIES
    var saloons = [GetCategoryByIDModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for saloon in saloons {
           
            let coordinate = CLLocationCoordinate2D(latitude: /saloon.shop_latitude?.toDouble(), longitude: /saloon.shop_latitude?.toDouble())
            setPinUsingMKPlacemark(location: coordinate, title: saloon.shop_name )
        }
    }
   

    func setPinUsingMKPlacemark(location: CLLocationCoordinate2D, title: String?) {
        
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.setRegion(coordinateRegion, animated: true)
        annotation.coordinate = centerCoordinate
        annotation.title = /title
        mapView.addAnnotation(annotation)
    }

}
