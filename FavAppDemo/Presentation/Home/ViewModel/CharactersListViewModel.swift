//
//  CharactersListViewModel.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import Foundation

class CharactersListViewModel: ObservableObject {
    var getCharactersUseCase: GetAllCharacterProtocol
    
    @Published var characters: [Character] = []
    
    init(getCharactersUseCase: GetAllCharacterProtocol = GetAllCharactersUseCase(repository: CharacterRepositoryImpl(dataSource: CharacterDataSourceImpl()))) {
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    @MainActor func getCharacters() async {
        let result = await getCharactersUseCase.fetchAllCharacters()
        switch result {
        case .success(let characters):
            self.characters = characters
        case .failure(let error):
            print(error)
        }
    }
}
