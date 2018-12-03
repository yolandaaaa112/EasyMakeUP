//
//  ListCitas.swift
//  EasyMakeUp
//
//  Created by Yolanda on 29/11/18.
//  Copyright © 2018 Yolanda. All rights reserved.
//

import UIKit

class ListCitas:  UIViewController,UITableViewDataSource,UITableViewDelegate {
    var cit: Citas?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        let izqui = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        izqui.direction = .left
        self.view.addGestureRecognizer(izqui)
        let dere = UISwipeGestureRecognizer(target: self, action: #selector(swipeRigh))
        dere.direction = .right
        self.view.addGestureRecognizer(dere)
        // Do any additional setup after loading the view.
    }
    @objc func swipeLeft(){
        let total = (self.tabBarController!.viewControllers?.count)!-1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex+1)
    }
    @objc func swipeRigh(){
        tabBarController!.selectedIndex = min(0, tabBarController!.selectedIndex-1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cita.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier:"celdaCita")
        cel?.textLabel?.text=cita[indexPath.row].estetica
        cel?.detailTextLabel?.text=cita[indexPath.row].fecha
        
        return cel!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetalleCita
        destination.cit = self.cit
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cit = cita[indexPath.row]
        performSegue(withIdentifier: "detail3", sender: self)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle==UITableViewCellEditingStyle.delete{
    cita.remove(at: indexPath.row)
    tableView.reloadData()
    }
    }
    

}
