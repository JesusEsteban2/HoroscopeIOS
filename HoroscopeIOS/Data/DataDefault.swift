//
//  DataDefault.swift
//  HoroscopeIOS
//
//  Created by Mañanas on 10/4/24.
//

import UIKit

class DataDefault:NSObject{
    
    func defaultSave (isFav:Bool,key:Int){
        let keyString = String(key)
        UserDefaults.standard.set(isFav,forKey:keyString)
        UserDefaults.standard.synchronize()
        
    }
    
    func defaultRead (key:Int)->Bool{
        let keyString = String(key)
        var isFav:Bool = false
        isFav = UserDefaults.standard.bool(forKey: keyString) 
                            
        return isFav
    }
}
