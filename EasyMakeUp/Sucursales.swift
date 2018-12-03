//
//  Sucursales.swift
//  EasyMakeUp
//
//  Created by Yolanda on 29/11/18.
//  Copyright © 2018 Yolanda. All rights reserved.
//

import UIKit

class Sucursales: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    @IBOutlet weak var tableView: UITableView!
    var sucu: SucursalObjeto?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        OperationQueue.main.addOperation({
            self.tableView.reloadData()
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sucursal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as! Sucursal
        
        cell.nombre.text = sucursal[indexPath.row].name
        cell.direccion.text = sucursal[indexPath.row].street+" "+sucursal[indexPath.row].city+" "+sucursal[indexPath.row].zip
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sucu = sucursal[indexPath.row]
        performSegue(withIdentifier: "detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetallesSucu
        destination.sucu = self.sucu
    }

}
class Sucursal:UITableViewCell{
    @IBOutlet var nombre: UILabel!
    @IBOutlet var direccion: UILabel!
    
    
}
class SucursalObjeto {
    var name: String
    var email: String
    var phone: String
    var lat: Double
    var lng: Double
    var street: String
    var city: String
    var zip: String
    
    init(name: String, email:String, phone: String, lat: Double, lng: Double, street: String, city: String, zip: String){
        self.name = name
        self.email = email
        self.phone = phone
        self.lat = lat
        self.lng = lng
        self.street = street
        self.city = city
        self.zip = zip
    }
}
