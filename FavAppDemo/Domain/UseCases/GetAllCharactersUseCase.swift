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
    func fetchAllCharacters() -> Result<[Character], UseCaseError>
}


struct GetAllCharactersUseCase: GetAllCharacterProtocol {
    var repository: CharacterRepository
    
    func fetchAllCharacters() -> Result<[Character], UseCaseError> {
        let characters = repository.fetchAllCharacters()
        return .success(characters)
    }
}
