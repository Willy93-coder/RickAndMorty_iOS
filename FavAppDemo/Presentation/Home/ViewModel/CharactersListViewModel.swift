//
//  CharactersListViewModel.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import Foundation

class CharactersListViewModel: ObservableObject {
    var getCharactersUseCase = GetAllCharactersUseCase(repository: CharacterRepositoryImpl(dataSource: CharacterDataSourceImpl()))
    
    @Published var characters: [Character] = []
    
    func getCharacters() {
        let result = getCharactersUseCase.fetchAllCharacters()
        switch result {
        case .success(let characters):
            self.characters = characters
        case .failure(let error):
            print(error)
        }
    }
}
