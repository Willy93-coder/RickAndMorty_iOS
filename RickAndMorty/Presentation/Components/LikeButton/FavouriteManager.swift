//
//  LikesManager.swift
//  RickAndMorty
//
//  Created by Willy on 23/10/24.
//

import Foundation

class FavouriteManager: ObservableObject {
    
    static let key = "favCharacters"
    @Published var favCharacters: [Int] = []
    
    init() {}
    
    func isFavourite(id: Int) -> Bool {
        return favCharacters.contains{ $0 == id }
    }
    
    func toggleLike(_ character: Character) {
        if !isFavourite(id: character.id) {
            favCharacters.append(character.id)
        } else {
            favCharacters.removeAll{ $0 == character.id }
        }
    }
}
