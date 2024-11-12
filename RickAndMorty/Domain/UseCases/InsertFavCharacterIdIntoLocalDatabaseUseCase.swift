//
//  InsertFavCharacterIdIntoLocalDatabaseUseCase.swift
//  RickAndMorty
//
//  Created by Guillermo Cifre on 12/11/24.
//

import Foundation

protocol InsertFavCharacterIdIntoLocalDatabaseUseCaseProtocol {
    func execute(favCharacterId: FavCharacterId)
}

struct InsertFavCharacterIdIntoLocalDatabaseUseCase: InsertFavCharacterIdIntoLocalDatabaseUseCaseProtocol {
    var repository: CharacterRepositoryProtocols
    
    func execute(favCharacterId: FavCharacterId) {
        do {
            try repository.insertFavCharacterIdIntoLocalDatabase(favCharacterId: favCharacterId)
        } catch {
            fatalError("Error inserting fav character id into local database")
        }
    }
}
