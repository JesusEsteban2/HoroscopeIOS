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
    
    @IBOutlet weak var favBut: UIButton!
    @IBOutlet weak var noFavBut: UIButton!
    
    let defa=DataDefault()
    
    var horoParam:Horoscope?=nil
    var fila:Int=0
    
    
    
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        var nom:String?=""
        let isFav=defa.defaultRead (key:fila)
        
        if isFav {
            favBut.isHidden=false
            noFavBut.isHidden=true
        } else {
            favBut.isHidden=true
            noFavBut.isHidden=false
        }
        
        Task{
            do {
                try await nom = performAPICall(name:horoParam!.imageName)
                // print ("pronostico recibido: \(nom!)")
                texto.text=nom
            }   catch { print ("No se ha podido conectar")
            }
        }
        

        nombre.text=horoParam?.nombre
        fechas.text=horoParam?.fechas
        image.image = UIImage(named: horoParam!.imageName)
        
        
    }
    
    @IBAction func favorButton(_ sender: Any) {
        favBut.isHidden=true
        noFavBut.isHidden=false
        defa.defaultSave (isFav:false,key:fila)
    }
    
    
    @IBAction func noFavButton(_ sender: Any) {
        favBut.isHidden=false
        noFavBut.isHidden=true
        defa.defaultSave (isFav:true,key:fila)
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
