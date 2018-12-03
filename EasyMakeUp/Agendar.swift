//
//  Agendar.swift
//  EasyMakeUp
//
//  Created by Yolanda on 29/11/18.
//  Copyright © 2018 Yolanda. All rights reserved.
//

import UIKit
var cita = [Citas]()
class Agendar: UIViewController {
    var sucu: SucursalObjeto?
    
    @IBOutlet weak var cal: UIDatePicker!
    @IBOutlet weak var fecha: UIDatePicker!
    @IBOutlet weak var estetica: UILabel!
    @IBOutlet weak var nombre: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text=usar[pasar].name
        estetica.text=sucu?.name
        let izqui = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        izqui.direction = .left
        self.view.addGestureRecognizer(izqui)
        let dere = UISwipeGestureRecognizer(target: self, action: #selector(swipeRigh))
        dere.direction = .right
        self.view.addGestureRecognizer(dere)
        
    }
    @objc func swipeLeft(){
        let total = (self.tabBarController!.viewControllers?.count)!-1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex+1)
    }
    @objc func swipeRigh(){
        tabBarController!.selectedIndex = min(0, tabBarController!.selectedIndex-1)
    }
    @IBAction func agendar(_ sender: Any) {
        let fec = "\(String(describing: cal.date))"
        let alerta = UIAlertController(title: "Se agregara una cita", message: "Pulsa Ok para aceptar", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Default action"), style: .default, handler: { _ in
            cita.append(Citas(estetica: (self.sucu?.name)!, telefono: (self.sucu?.phone)!, domicilio: (self.sucu?.street)!+" "+(self.sucu?.zip)!+" "+(self.sucu?.city)!, fecha: fec,lat: (self.sucu?.lat)!,lng: (self.sucu?.lng)!))
            
        }))
        alerta.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: {(action) in
            
        }))
        self.present(alerta, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
class Citas: NSObject{
    var estetica: String
    var telefono:String
    var domicilio:String
    var fecha: String
    var lat: Double
    var lng: Double
    
    init(estetica: String,telefono:String,domicilio:String, fecha: String,lat:Double,lng:Double) {
        self.estetica = estetica
        self.domicilio=domicilio
        self.telefono=telefono
        self.fecha = fecha
        self.lat=lat
        self.lng=lng
    }
    
}
