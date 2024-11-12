//
//  GetCharacter.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation

protocol GetAllCharactersFromAPIUseCaseProtocol {
    func fetchAllCharacters() async -> [Character]
}

struct GetAllCharactersFromAPIUseCase: GetAllCharactersFromAPIUseCaseProtocol {
    var repository: CharacterRepositoryProtocols
    
    func fetchAllCharacters() async -> [Character] {
        do {
            return try await repository.fetchAllCharactersFromNetwork()
        } catch {
            print("Error fetching characters: \(error.localizedDescription)")
            return []
        }
    }
}
