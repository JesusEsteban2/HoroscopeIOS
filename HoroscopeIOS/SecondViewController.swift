//
//  SecondViewController.swift
//  HoroscopeIOS
//
//  Created by Mañanas on 4/4/24.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var fechas: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var horoParam:Horoscope?=nil
    

    
    
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        nombre.text=horoParam?.nombre
        fechas.text=horoParam?.fechas
        image.image = UIImage(named: horoParam!.imageName)
        
    }
    
    
    
    // let texto=try performAPICall(name:horoParam!.nombre)
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
