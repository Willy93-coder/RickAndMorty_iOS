//
//  CharacterRepository.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation

protocol CharacterRepositoryProtocols {
    func fetchAllCharactersFromNetwork() async throws -> [Character]
    
    func fectFavCharactersIdFromLocalDatabase() throws -> [FavCharacterId]
    
    func insertFavCharacterIdIntoLocalDatabase(favCharacterId: FavCharacterId) throws
    
    func removeFavCharacterIdFromLocalDatabase(characterId: Int) throws
}
