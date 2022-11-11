//
//  ViewController.swift
//  RickandMortyJECM
//
//  Created by Jesús Enrique Castro on 10/11/22.
//



import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet var table: UITableView!
    var image:String?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personajes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! personCell
        let personaje = personajes[indexPath.row]
        cell.name.text = personaje.name

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        image = personajes[indexPath.row].image
            self.performSegue(withIdentifier: "detalles", sender: Self.self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destination = segue.destination as! DetailViewController
            destination.imagenUrl = image
        }
    
    var personajes = [Result]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ad = UIApplication.shared.delegate as! AppDelegate
                if ad.internetStatus {
                    if let url=URL(string:"https://rickandmortyapi.com/api/character/") {
                        do {
                            let bytes = try Data(contentsOf: url)
                            let rick = try JSONDecoder().decode(Rick.self, from: bytes)
                                personajes = rick.results
                        }
                        catch {
                        }
                    }
                }
                else {
                    let ac = UIAlertController(title:"Error", message:"Lo sentimos, pero al parecer no hay conexión a Internet", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Enterado", style: .default)
                    ac.addAction(action)
                    self.present(ac, animated: true)
                }
    }


}

