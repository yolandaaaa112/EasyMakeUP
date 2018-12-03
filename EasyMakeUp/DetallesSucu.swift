//
//  DetallesSucu.swift
//  EasyMakeUp
//
//  Created by Yolanda on 29/11/18.
//  Copyright © 2018 Yolanda. All rights reserved.
//

import UIKit

class DetallesSucu: UIViewController {
    var sucu: SucursalObjeto?
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var telefono: UILabel!
    @IBOutlet weak var calle: UILabel!
    @IBOutlet weak var ciudad: UILabel!
    @IBOutlet weak var zip: UILabel!
    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var lon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.text=sucu?.email
        nombre.text=sucu?.name
        telefono.text=sucu?.phone
        calle.text=sucu?.street
        ciudad.text=sucu?.city
        zip.text=sucu?.zip
        lat.text=sucu?.lat.description
        lon.text=sucu?.lng.description
    }
    
    @IBAction func showMap(_ sender: Any) {
        performSegue(withIdentifier: "map", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! Mapa
        destination.name = self.sucu?.name
        destination.lat = self.sucu?.lat
        destination.lng = self.sucu?.lng
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
