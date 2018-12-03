//
//  Datos.swift
//  EasyMakeUp
//
//  Created by Yolanda on 28/11/18.
//  Copyright © 2018 Yolanda. All rights reserved.
//

import UIKit
import Foundation

class Datos: UIViewController {
    var imagee: UIImage!
    var imagePick = UIImagePickerController()
    @IBOutlet var imagen: UIButton!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var telefono: UITextField!
    @IBOutlet weak var ciudad: UITextField!
    @IBOutlet weak var pais: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text=usar[pasar].name
        telefono.text=usar[pasar].telefono
        ciudad.text=usar[pasar].ciudad
        pais.text=usar[pasar].pais
        imagen.setImage(usar[pasar].foto, for: .normal)
        // Do any additional setup after loading the view.
    }
    @IBAction func agreFoto(_ sender: Any) {
        let alerta = UIAlertController(title: "Escoge", message: "Selecciona si quieres tomarte una foto o cargarla de album", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: NSLocalizedString("Galeria", comment: "Default action"), style: .default, handler: { _ in
            self.imagePick.sourceType = .photoLibrary
            self.imagePick.allowsEditing = true
            self.imagePick.delegate = self
            self.present(self.imagePick, animated: true, completion: nil)
        }))
        alerta.addAction(UIAlertAction(title: "Camara", style: .default, handler: {(action) in
            self.imagePick.sourceType = .camera
            self.imagePick.allowsEditing = true
            self.imagePick.delegate = self
            self.present(self.imagePick, animated: true, completion: nil)
        }))
        self.present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func guardar(_ sender: Any) {
        let usuario = usar[pasar].usuario
        let pass=usar[pasar].password
        if((nombre.text?.isEmpty))!{
            let alerta2 = UIAlertController(title: "Alerta", message: "Debes de registrar el nombre", preferredStyle: .alert)
            alerta2.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {(action) in
                
            }))
            self.present(alerta2, animated: true, completion: nil)
        }else{
            let alerta = UIAlertController(title: "Se editaran tus datos", message: "Pulsa Ok para aceptar", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Default action"), style: .default, handler: { _ in
                
                usar.insert(Usuario(usuario: usuario, name: self.nombre.text!, password: pass, telefono: self.telefono.text!, ciudad: self.ciudad.text!, pais: self.pais.text!, foto: self.imagee), at: pasar)
                
            }))
            alerta.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: {(action) in
                
            }))
            self.present(alerta, animated: true, completion: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension Datos: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            imagen.setImage(image, for: .normal)
            imagee = image
        }
        dismiss(animated: true, completion: nil)
    }
    
}
