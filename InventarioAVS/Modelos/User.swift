//
//  User.swift
//  InventarioAVS
//
//  Created by Omar Campos on 19/11/20.
//

import Foundation
struct User : Codable {
    let iD : Int?
    let nombre : String?
    let apellido_paterno : String?
    let apellido_materno : String?
    let iDtipoUsuario : Int?
    let fecha : String?
    let telefono : String?
    let correo : String?
    let rol : String?
    let foto : String?

    enum CodingKeys: String, CodingKey {

        case iD = "ID"
        case nombre = "nombre"
        case apellido_paterno = "apellido_paterno"
        case apellido_materno = "apellido_materno"
        case iDtipoUsuario = "IDtipoUsuario"
        case fecha = "fecha"
        case telefono = "telefono"
        case correo = "correo"
        case rol = "rol"
        case foto = "foto"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        iD = try values.decodeIfPresent(Int.self, forKey: .iD)
        nombre = try values.decodeIfPresent(String.self, forKey: .nombre)
        apellido_paterno = try values.decodeIfPresent(String.self, forKey: .apellido_paterno)
        apellido_materno = try values.decodeIfPresent(String.self, forKey: .apellido_materno)
        iDtipoUsuario = try values.decodeIfPresent(Int.self, forKey: .iDtipoUsuario)
        fecha = try values.decodeIfPresent(String.self, forKey: .fecha)
        telefono = try values.decodeIfPresent(String.self, forKey: .telefono)
        correo = try values.decodeIfPresent(String.self, forKey: .correo)
        rol = try values.decodeIfPresent(String.self, forKey: .rol)
        foto = try values.decodeIfPresent(String.self, forKey: .foto)
    }

}
