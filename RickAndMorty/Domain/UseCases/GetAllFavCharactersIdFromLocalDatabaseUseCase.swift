//
//  GetAllFavCharactersIdFromLocalDatabaseUseCase.swift
//  RickAndMorty
//
//  Created by Guillermo Cifre on 12/11/24.
//

import Foundation

protocol GetAllFavCharactersIdFromLocalDatabaseUseCaseProtocol {
    func execute() -> [Int]
}

struct GetAllFavCharactersIdFromLocalDatabaseUseCase: GetAllFavCharactersIdFromLocalDatabaseUseCaseProtocol {
    var repository: CharacterRepositoryProtocols
    
    func execute() -> [Int] {
        do {
            return try repository.fectFavCharactersIdFromLocalDatabase().map { $0.favCharacterId }
        } catch {
            return []
        }
    }
}
