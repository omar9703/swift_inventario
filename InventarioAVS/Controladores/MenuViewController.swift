//
//  MenuViewController.swift
//  InventarioAVS
//
//  Created by Omar Campos on 19/11/20.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    var nombreUsuario : String?

    @IBOutlet weak var nombreText: UILabel!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var correoText: UILabel!
    @IBOutlet weak var telefonoText: UILabel!
    var backgroundImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let v = login()
        v.getUserbyName(completion: { (user) in
            DispatchQueue.main.async {
                self.nombreText.text = user![0]["nombre"].string! + " " + user![0]["apellido_paterno"].string! + " " + user![0]["apellido_materno"].string!
                self.correoText.text = user![0]["correo"].string!
                self.telefonoText.text = user![0]["telefono"].string!
            }
        }, nombre: nombreUsuario!)
        self.backgroundImage = UIImageView(image: UIImage(named: "nuevofondo"))
        self.backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(self.backgroundImage, at: 0)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.backgroundImage.frame = self.view.bounds
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
