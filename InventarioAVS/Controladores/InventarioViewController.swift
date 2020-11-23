//
//  InventarioViewController.swift
//  InventarioAVS
//
//  Created by Omar Campos on 23/11/20.
//

import UIKit

class InventarioViewController: UIViewController {
    var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.backgroundImage = UIImageView(image: UIImage(named: "nuevofondo"))
        self.backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(self.backgroundImage, at: 0)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.backgroundImage.frame = self.view.bounds
    }
    
    @IBAction func ScanningButton(_ sender: UIButton) {
        
        
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
