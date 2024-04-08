//
//  ViewController.swift
//  HoroscopeIOS
//
//  Created by Mañanas on 4/4/24.
//

import UIKit

    
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    
    @IBOutlet var tableView: UITableView!
    
    let model=horoArray
    var filaGen:Horoscope=horoArray[0]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "standarCell", for:indexPath)
        
        
        var listContentConfiguration = UIListContentConfiguration.cell()
        let fila = model[indexPath.row]
        
        
        listContentConfiguration.image = UIImage(named: fila.imageName)
        listContentConfiguration.text = fila.nombre
        listContentConfiguration.secondaryText = fila.fechas
            
        cell.contentConfiguration = listContentConfiguration
        
        return cell
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        filaGen=model[indexPath.row]
        print("Has seleccionado: \(filaGen.nombre)")
        
    }
    
    @IBSegueAction func nav(_ coder: NSCoder, sender: Any?) -> SecondViewController? {
        
        print("Has pasado: \(filaGen.nombre)")
        let viewController = SecondViewController(coder: coder)
        
        viewController?.param1=filaGen.nombre
        
        return viewController
    }

    
}

