//
//  ListSucuAgen.swift
//  EasyMakeUp
//
//  Created by Yolanda on 29/11/18.
//  Copyright © 2018 Yolanda. All rights reserved.
//

import UIKit

class ListSucuAgen: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var sucu: SucursalObjeto?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        OperationQueue.main.addOperation({
            self.tableView.reloadData()
        })
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sucursal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom2", for: indexPath) as! Sucursal2
        
        cell.nombre.text = sucursal[indexPath.row].name
        cell.direccion.text = sucursal[indexPath.row].street+" "+sucursal[indexPath.row].city+" "+sucursal[indexPath.row].zip
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sucu = sucursal[indexPath.row]
        performSegue(withIdentifier: "detail2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! Agendar
        destination.sucu = self.sucu
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
class Sucursal2:UITableViewCell{
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var direccion: UILabel!
    
    
}
