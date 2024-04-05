//
//  ViewController.swift
//  HoroscopeIOS
//
//  Created by Mañanas on 4/4/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
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
    
    
    private let devicesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        devicesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        devicesTableView.rowHeight=64
        devicesTableView.backgroundColor = .blue
        devicesTableView.dataSource = self
        view.addSubview(devicesTableView)
         
         NSLayoutConstraint.activate([
             devicesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             devicesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             devicesTableView.topAnchor.constraint(equalTo: view.topAnchor),
             devicesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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

