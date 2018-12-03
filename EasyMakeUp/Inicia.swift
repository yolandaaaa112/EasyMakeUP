//
//  Inicia.swift
//  EasyMakeUp
//
//  Created by Yolanda on 28/11/18.
//  Copyright © 2018 Yolanda. All rights reserved.
//

import UIKit
var sucursal = [SucursalObjeto]()

class Inicia: UIViewController {
    @IBOutlet weak var nombre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text=usar[pasar].name
        //String de la url del servicio
        let urlString = "https://pastebin.com/raw/57w98pn2"
        //Objeto url
        let url = URL(string: urlString)
        
        //Tarea de petición
        let peticion = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            //Verificar si existe algún error
            if(error != nil){
                print("Error: \(String(describing: error))")
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
                    //print(json)
                    //Llenado de contenedor local (usuarios)
                    for user in json{
                        //Extraer la info
                        let name = user["name"] as! String
                        let email = user["email"] as! String
                        let phone = user["phone"] as! String
                        let address = user["address"] as! [String: AnyObject]
                        let street = address["street"] as! String
                        let city = address["city"] as! String
                        let zip = address["zipcode"] as! String
                        let geo = address["geo"] as! [String: AnyObject]
                        let lat = Double(geo["lat"] as! String)
                        let lng = Double(geo["lng"] as! String)
                        print(address)
                        //Agregar info al arreglo
                        sucursal.append(SucursalObjeto(name: name, email: email, phone: phone, lat: lat!, lng: lng!, street: street, city: city, zip: zip))
                    }
                    
                } catch let error as NSError{
                    print(error)
                }
            }
        }
        
        peticion.resume()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        nombre.text=usar[pasar].name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
