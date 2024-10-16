//
//  CharacterRepository.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation

protocol CharacterRepository {
    func fetchAllCharacters() -> [Character]
}
