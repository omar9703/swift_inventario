//
//  LoginHTTP.swift
//  InventarioAVS
//
//  Created by Omar Campos on 19/11/20.
//

import Foundation
import UIKit
import SwiftyJSON

struct Response: Codable {
    let message : String
}

struct login  {
    
    func getUserbyName(completion : @escaping (_ response: JSON?)->(), nombre : String){
        var resp = JSON()
        let url = URL(string: "https://avsinvservice.azurewebsites.net/userbyname/\(nombre)")! //change the url

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            if let json = try? JSON(data: data) {
                    for item in json.arrayValue {
                        print(item["nombre"].stringValue)
                    }
                resp = json
                
                }
            completion(resp)
        }
        task.resume()
        
        
    }
}

