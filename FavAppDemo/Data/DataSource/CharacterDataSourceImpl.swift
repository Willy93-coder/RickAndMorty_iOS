//
//  CharactersDataSourceImpl.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation

struct CharacterDataSourceImpl: CharacterDataSource {
    func getAllCharacters() -> [Character] {
        return [
            Character(id: 1, name: "Rick Sanchez", image: "", species: "Human", gender: "Male", created: "2017-11-04"),
            Character(id: 2, name: "Morty Smith", image: "", species: "Human", gender: "Male", created: "2017-11-04"),
            Character(id: 3, name: "Summer Smith", image: "", species: "Human", gender: "Female", created: "2017-11-04"),
        ]
    }
}
