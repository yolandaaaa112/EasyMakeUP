//
//  Videos.swift
//  EasyMakeUp
//
//  Created by Yolanda on 03/12/18.
//  Copyright © 2018 Yolanda. All rights reserved.
//

import UIKit

class Videos: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var videos = [VideosObjeto]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        let urlString = "https://pastebin.com/raw/KXrGTeaB"
        let url = URL(string: urlString)
        let peticion = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if(error != nil){
                print("Error: \(String(describing: error))")
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
                    for user in json{
                        let imagen = user["imagen"] as! String
                        let descripcion = user["descripcion"] as! String
                        let link = user["link"] as! String
                        self.videos.append(VideosObjeto(imagen: imagen, descripcion: descripcion, link: link))
                    }
                    
                } catch let error as NSError{
                    print(error)
                }
            }
        }
        
        peticion.resume()
        self.tableView.reloadData()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videos", for: indexPath) as! Vid
        let urlString = videos[indexPath.row].imagen //Lista con las URLs
        let url = URL(string: urlString)!
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data as Data) {
                    DispatchQueue.main.async {
                        cell.imagen.image=image
                    }
                }
            }
        }
        cell.descripcion.text = videos[indexPath.row].descripcion
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIApplication.shared.openURL(NSURL(string:videos[indexPath.row].link)! as URL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
class Vid:UITableViewCell{
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var descripcion: UILabel!
}
class VideosObjeto{
    var imagen: String
    var descripcion: String
    var link: String
    init(imagen:String,descripcion:String,link:String) {
        self.imagen=imagen
        self.descripcion=descripcion
        self.link=link
    }
}
