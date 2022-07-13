//
//  NetworkManager.swift
//  GraphQLApp
//
//  Created by Hakan on 9.07.2022.
//

import UIKit
import Apollo

class Network {
    static let shared = Network()
    var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql/")!)
}

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    
    
}
