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
    @IBOutlet var texto: UILabel!
    
    @IBOutlet weak var noFav: UIImageView!
    @IBOutlet weak var favImage: UIImageView!
    
    var horoParam:Horoscope?=nil
    
    
    
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        var nom:String?=""
        
        Task{
            do {
                try await nom = performAPICall(name:horoParam!.imageName)
                print ("pronostico recibido: \(nom!)")
                texto.text=nom
            }   catch { print ("No se ha podido conectar")
            }
        }
        

        nombre.text=horoParam?.nombre
        fechas.text=horoParam?.fechas
        image.image = UIImage(named: horoParam!.imageName)
        
    }
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
