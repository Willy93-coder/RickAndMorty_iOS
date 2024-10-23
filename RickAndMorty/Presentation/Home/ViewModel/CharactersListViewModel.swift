//
//  CharactersListViewModel.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import Foundation

class CharactersListViewModel: ObservableObject {
    var getAllCharactersUseCase: GetAllCharactersProtocol
    
    @Published var characters: [Character] = []
    
    init(getCharactersUseCase: GetAllCharactersProtocol = GetAllCharactersUseCase(repository: CharacterRepositoryImpl(dataSource: CharacterDataSourceImpl()))) {
        self.getAllCharactersUseCase = getCharactersUseCase
    }
    
    @MainActor func getCharacters() async {
        let result = await getAllCharactersUseCase.fetchAllCharacters()
        switch result {
        case .success(let characters):
            self.characters = characters
        case .failure(let error):
            print(error)
        }
    }
}
