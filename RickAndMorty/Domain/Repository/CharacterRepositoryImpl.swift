//
//  CharacterRepositoryImpl.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation

struct CharacterRepositoryImpl: CharacterRepositoryProtocols {

    var networkDataSource: NetworkCharacterDataSourceProtocols
    var localDataSource: LocalCharacterDataSourceProtocols
    
    func fetchAllCharactersFromNetwork() async throws -> [Character] {
        return try await networkDataSource.fetchAllCharacters()
    }
    
    func fectFavCharactersIdFromLocalDatabase() throws -> [FavCharacterId] {
        return try localDataSource.fetchAllFavoriteCharactersId()
    }
    
    func insertFavCharacterIdIntoLocalDatabase(favCharacterId: FavCharacterId) throws {
        try localDataSource.insertFavoriteCharacterId(favCharacterId)
    }
    
    func removeFavCharacterIdFromLocalDatabase(characterId: Int) throws {
        try localDataSource.removeFavoriteCharacterId(characterId)
    }
}
