//
//  ViewController.swift
//  InventarioAVS
//
//  Created by Omar Campos on 19/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    var result = ""

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var nombreText: UITextField!
    @IBOutlet weak var contraText: UITextField!
     
    var backgroundImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.backgroundImage = UIImageView(image: UIImage(named: "nuevofondo"))
        self.backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(self.backgroundImage, at: 0)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.backgroundImage.frame = self.view.bounds
    }

    @IBAction func LoginAction(_ sender: UIButton) {
        indicator.startAnimating()
        let nombre = self.nombreText.text
        let pas = self.contraText.text
        PerformLogin(n: nombre!, s: pas!)
    }
    
    func PerformLogin(n : String, s : String){
            self.post(completion: { (respuesta) in
                DispatchQueue.main.async {
                    if respuesta == "OK"{
                        self.performSegue(withIdentifier: "login", sender: self)
                        self.indicator.stopAnimating()
                        
                    }
                    else
                    {
                        self.indicator.stopAnimating()
                        let alert = UIAlertController(title: "Error", message: "Error al iniciar sesion", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Aceptar", style: .destructive, handler: nil))
                        self.present(alert, animated: true)
                    }
                }
                
            }, name: n, pass: s)
        
    
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login"{
            let barView = segue.destination as! UITabBarController
            let destinationView = barView.viewControllers?[0] as! MenuViewController
            destinationView.nombreUsuario = self.nombreText.text!
        }
    }
    func post(completion : @escaping (_ response: String?)->(), name: String, pass : String){
        
        let parameters = ["nombre": name, "password": pass]
       

            //create the url with URL
            let url = URL(string: "https://avsinvservice.azurewebsites.net/loginpre")! //change the url
        
            //create the session object
        var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
                
            
            request.httpBody = httpBody
            request.timeoutInterval = 20
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(Response.self, from: data)
                        print(json.message)
                        self.result = json.message
                        print("holaasd")
                        
                    } catch {
                        print(error)
                    }
                }
                
                completion(self.result)
            }
        task.resume()
        
    }
    
}

