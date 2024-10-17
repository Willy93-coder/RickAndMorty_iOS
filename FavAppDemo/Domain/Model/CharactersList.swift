//
//  CharactersList.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import Foundation

struct CharactersList: Decodable {
    var charactersList: [Character]
    
    enum CodingKeys: String, CodingKey {
        case charactersList = "results"
    }
}
