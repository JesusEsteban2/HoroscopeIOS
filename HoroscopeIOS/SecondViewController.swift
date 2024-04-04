//
//  SecondViewController.swift
//  HoroscopeIOS
//
//  Created by Mañanas on 4/4/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    var param1:String=""
    
    @IBOutlet weak var hola: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        hola.text=param1
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
