//
//  HoroscopeCell.swift
//  HoroscopeIOS
//
//  Created by Mañanas on 10/4/24.
//

import UIKit

class HoroscopeCell : UITableViewCell {
    
    @IBOutlet weak var imageHoros: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var subtitulo: UILabel!
    @IBOutlet weak var favorito: UIButton!
    
    func render (ima:String,tit:String,subtit:String,fav:Bool){
        imageHoros.image=UIImage(named: ima)
        titulo.text=tit
        subtitulo.text=subtit
        favorito.isHidden = !(fav)
    }
    
}
