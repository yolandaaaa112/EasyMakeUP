//
//  Mapa.swift
//  EasyMakeUp
//
//  Created by Yolanda on 29/11/18.
//  Copyright © 2018 Yolanda. All rights reserved.
//

import UIKit
import MapKit

final class Anotacion: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    init(cordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate=cordinate
        self.title=title
    }
    var region: MKCoordinateRegion{
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}

class Mapa: UIViewController, MKMapViewDelegate  {
    var name: String?
    var lat: Double?
    var lng: Double?
    
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        map.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        //let cordenada = CLLocationCoordinate2D(latitude: 21.220040, longitude: -104.597661)
        let cordenada = CLLocationCoordinate2D(latitude: lat!, longitude: lng!)
        let anotacion = Anotacion(cordinate: cordenada, title: name!)
        let cordenadaO = CLLocationCoordinate2D(latitude: 20.744478, longitude: -103.378901)
        let anotacionO = Anotacion(cordinate: cordenadaO, title: "Origen")
        map.addAnnotation(anotacion)
        map.addAnnotation(anotacionO)
        let inicioLugar = MKPlacemark(coordinate: cordenadaO)
        let finLugar = MKPlacemark(coordinate: cordenada)
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = MKMapItem(placemark: inicioLugar)
        directionRequest.destination = MKMapItem(placemark: finLugar)
        directionRequest.transportType = .automobile
        let direction = MKDirections (request: directionRequest)
        direction.calculate {(response, error) in
            guard let directionsResonse = response else{
                if error != nil{
                    print("Hubo un error")
                }
                return
            }
            let route = directionsResonse.routes[0]
            self.map.add(route.polyline, level: .aboveRoads)
            let ract = route.polyline.boundingMapRect
            self.map.setRegion(MKCoordinateRegionForMapRect(ract), animated: true)
        }
        self.map.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }

}
