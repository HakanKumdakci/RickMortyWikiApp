//
//  Character.swift
//  GraphQLApp
//
//  Created by Akakce on 19.08.2021.
//

import Foundation
import ObjectMapper

struct Character: Codable {
    var id: String
    var name: String
    var image: String
}


struct CharacterDetail: Codable {
    var id: String
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Location?
    var location: Location?
    var episode: [Episode]
    var created: String
    var image: String
}
