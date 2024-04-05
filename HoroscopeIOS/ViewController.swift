//
//  ViewController.swift
//  HoroscopeIOS
//
//  Created by Mañanas on 4/4/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var fila:Int = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = horoArray[indexPath.row]
        print("CELL: \(model.nombre)")
        fila=indexPath.row
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        horoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
                
        let model = horoArray[indexPath.row]
                
        var listContentConfiguration = UIListContentConfiguration.cell()
        listContentConfiguration.image = UIImage(named: model.imageName)
        listContentConfiguration.text = model.nombre
        listContentConfiguration.secondaryText = model.fechas
        cell.contentConfiguration = listContentConfiguration
        return cell
    }
    
    
    private let horoscopoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        horoscopoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        horoscopoTableView.rowHeight=64
        horoscopoTableView.backgroundColor = .blue
        horoscopoTableView.dataSource = self
        horoscopoTableView.delegate = self
        view.addSubview(horoscopoTableView)
         
         NSLayoutConstraint.activate([
             horoscopoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             horoscopoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             horoscopoTableView.topAnchor.constraint(equalTo: view.topAnchor),
             horoscopoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         ])
     }

    //Llamada a 2 pantalla y paso de parámetros.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="conec12") {
            let secondViewControler = segue.destination as? SecondViewController
            secondViewControler?.param1="Hello Word"

        }
    }

}

