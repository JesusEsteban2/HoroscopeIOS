//
//  ViewController.swift
//  HoroscopeIOS
//
//  Created by Mañanas on 4/4/24.
//

import UIKit

    
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    
    let defa=DataDefault()
    var isFav=false

    let model=horoArray
    var filaGen:Horoscope=horoArray[0]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:HoroscopeCell = tableView.dequeueReusableCell(withIdentifier: "standarCell", for:indexPath) as! HoroscopeCell
        
        let fila = model[indexPath.row]
        
        cell.render(ima: fila.imageName, tit: fila.nombre, subtit: fila.fechas, fav: defa.defaultRead(key:indexPath.row))
        
        return cell
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
        }
    
    
    @IBSegueAction func nav(_ coder: NSCoder, sender: Any?) -> SecondViewController? {
        
        let fila=tableView.indexPathForSelectedRow
        filaGen=model[fila!.row]
        
        // print("Has pasado: \(filaGen.nombre)")
        let viewController = SecondViewController(coder: coder)
        
        
        viewController?.horoParam=filaGen
        viewController?.fila=fila!.row
        
        return viewController
    }

    
}

