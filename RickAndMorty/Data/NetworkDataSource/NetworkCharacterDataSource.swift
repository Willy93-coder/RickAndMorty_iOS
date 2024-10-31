//
//  CharacterDataSource.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation

protocol NetworkCharacterDataSource {
    func getAllCharacters() async throws -> [Character]
}
