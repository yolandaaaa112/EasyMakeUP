//
//  DetalleCita.swift
//  EasyMakeUp
//
//  Created by Yolanda on 29/11/18.
//  Copyright © 2018 Yolanda. All rights reserved.
//

import UIKit

class DetalleCita: UIViewController {
    var cit: Citas?
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var estetica: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var telefono: UILabel!
    @IBOutlet weak var domicilio: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text=usar[pasar].name
        estetica.text=cit?.estetica
        fecha.text=cit?.fecha
        telefono.text=cit?.telefono
        domicilio.text=cit?.domicilio
    }
    
    @IBAction func llegar(_ sender: Any) {
        performSegue(withIdentifier: "map2", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! Mapa
        destination.name = cit?.estetica
        destination.lat = cit?.lat
        destination.lng = cit?.lng
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
