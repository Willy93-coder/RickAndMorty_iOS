//
//  RemoveFavCharacterFromLocalDatabaseUseCase.swift
//  RickAndMorty
//
//  Created by Guillermo Cifre on 12/11/24.
//

import Foundation

protocol RemoveFavCharacterFromLocalDatabaseUseCaseProtocol {
    func execute(favCharacterId: Int)
}

struct RemoveFavCharacterFromLocalDatabaseUseCase: RemoveFavCharacterFromLocalDatabaseUseCaseProtocol {
    var repository: CharacterRepositoryProtocols
    
    func execute(favCharacterId: Int) {
        do {
            try repository.removeFavCharacterIdFromLocalDatabase(characterId: favCharacterId)
        } catch {
            fatalError("Error removing fav character from local database")
        }
    }
}
