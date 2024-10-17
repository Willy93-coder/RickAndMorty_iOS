//
//  CharacterRepositoryImpl.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation

struct CharacterRepositoryImpl: CharacterRepository {
   
    var dataSource: CharacterDataSource
    
    func fetchAllCharacters() async throws -> [Character] {
        return try await dataSource.getAllCharacters()
    }
}
