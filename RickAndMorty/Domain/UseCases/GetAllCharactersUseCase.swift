//
//  GetCharacter.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation

enum UseCaseError: Error {
    case networkError, decodingError, undefinedError
}

protocol GetAllCharacterProtocol {
    func fetchAllCharacters() async -> Result<[Character], UseCaseError>
}


struct GetAllCharactersUseCase: GetAllCharacterProtocol {
    var repository: CharacterRepository
    
    func fetchAllCharacters() async -> Result<[Character], UseCaseError> {
        do {
            let characters = try await repository.fetchAllCharacters()
            return .success(characters)
        } catch {
            return .failure(.undefinedError)
        }
    }
}
