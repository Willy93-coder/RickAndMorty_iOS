//
//  GetCharacter.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation

protocol GetAllCharactersUseCaseProtocol {
    func fetchAllCharacters() async -> [Character]
}

struct GetAllCharactersUseCase: GetAllCharactersUseCaseProtocol {
    var repository: CharacterRepository
    
    func fetchAllCharacters() async -> [Character] {
        do {
            return try await repository.fetchAllCharacters()
        } catch {
            print("Error fetching characters: \(error.localizedDescription)")
            return []
        }
    }
}
