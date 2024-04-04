//
//  ViewController.swift
//  HoroscopeIOS
//
//  Created by Mañanas on 4/4/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Llamada a 2 pantalla y paso de parámetros.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="conec12") {
            let secondViewControler = segue.destination as? SecondViewController
            secondViewControler?.param1="Hello Word"

        }
    }

}

