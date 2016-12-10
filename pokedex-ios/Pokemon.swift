//
//  Pokemon.swift
//  pokedex-ios
//
//  Created by Leon on 10/12/16.
//  Copyright © 2016 Leon. All rights reserved.
//

import Foundation

class Pokemon {
    fileprivate var _name: String!
    fileprivate var _pokemonId: Int!
    
    var name: String {
        return _name
    }
    
    var pokemonId: Int {
        return _pokemonId
    }
    
    init(name: String, pokemonId: Int) {
        _name = name
        _pokemonId = pokemonId
    }
}
