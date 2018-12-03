//
//  ViewController.swift
//  EasyMakeUp
//
//  Created by Yolanda on 28/11/18.
//  Copyright © 2018 Yolanda. All rights reserved.
//

import UIKit
var usar = [Usuario]()
var pasar=0
class ViewController: UIViewController {

    @IBOutlet weak var usuariotxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://pastebin.com/raw/vvS2kicQ"
        let url = URL(string: urlString)
        let peticion = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if(error != nil){
                print("Error: \(String(describing: error))")
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
                    for user in json{
                        let usuario = user["usuario"] as! String
                        let name = user["name"] as! String
                        let pass = user["password"] as! String
                        usar.append(Usuario(usuario: usuario, name: name, password: pass, telefono: "", ciudad: "", pais: "", foto: UIImage(named: "perfil")!))
                    }
                    
                } catch let error as NSError{
                    print(error)
                }
            }
        }
        
        peticion.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func iniciar(_ sender: UIButton) {
        let user = usuariotxt.text
        let cont = passwordTxt.text
        var con=0
        for users in usar{
            if (users.usuario == user) && (users.password == cont ){
                let alerta=UIAlertController(title: "Bienvenido: "+users.name, message: "", preferredStyle: UIAlertControllerStyle.alert)
                pasar=con
                alerta.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: {(action) in self.performSegue(withIdentifier: "home", sender: self)}))
                present(alerta, animated: true, completion: nil)
            }
            con=con+1
        }
        if((usuariotxt.text?.isEmpty)! || (passwordTxt.text?.isEmpty)!){
            let alerta=UIAlertController(title: "Error", message: "Rellena los datos", preferredStyle: UIAlertControllerStyle.alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alerta, animated: true, completion: nil)
        }
        let alerta=UIAlertController(title: "Error", message: "Usuario invalido", preferredStyle: UIAlertControllerStyle.alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alerta, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
class Usuario{
    var usuario = ""
    var name = ""
    var password = ""
    var telefono = ""
    var ciudad = ""
    var pais = ""
    var foto:UIImage
    init(usuario:String,name:String,password:String,telefono:String,ciudad:String,pais:String,foto:UIImage){
        self.usuario=usuario
        self.name=name
        self.password=password
        self.telefono=telefono
        self.ciudad=ciudad
        self.pais=pais
        self.foto=foto
    }
    
}

