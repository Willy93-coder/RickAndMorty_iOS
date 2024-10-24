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
    @Published var favCharacters: [Character] = []
    var likesManager: FavouriteManager = FavouriteManager()
    
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
    
    func updateFavCharactersList(_ character: Character) {
        if !likesManager.isFavourite(id: character.id), !isFavourite(character.id) {
            addToFavList(character)
        } else {
            removeFromFavList(character)
        }
    }
    
    private func addToFavList(_ character: Character) {
        favCharacters.append(character)
    }
    
    private func removeFromFavList(_ character: Character) {
        favCharacters.removeAll(where: { $0.id == character.id })
    }
    
    private func isFavourite(_ id: Int) -> Bool {
        favCharacters.contains { $0.id == id }
    }
}
