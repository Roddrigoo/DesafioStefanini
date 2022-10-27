//
//  Entities.swift
//  RodrigoRodrigues
//
//  Created by Rodrigo on 26/10/22.
//

import Foundation

struct Galleries: Codable {
    var data: [Gallery]
}

struct Gallery: Codable {
    var id: String
    var link: String
    var title: String?
    var description: String?
    var images: [Image]?
}

struct Image: Codable {
    var id: String
    var link: String
    var title: String?
    var description: String?
}
