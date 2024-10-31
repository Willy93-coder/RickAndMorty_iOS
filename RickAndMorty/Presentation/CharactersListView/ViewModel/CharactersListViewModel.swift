//
//  CharactersListViewModel.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import Foundation

class CharactersListViewModel: ObservableObject {
    private var getAllCharactersUseCase: GetAllCharactersUseCaseProtocol
    
    @Published var characters: [Character] = []
    @Published var favCharacters: [Character] = []
    var likesManager: FavouriteManager = FavouriteManager()
    
    init(getCharactersUseCase: GetAllCharactersUseCaseProtocol = GetAllCharactersUseCase(repository: CharacterRepositoryImpl(dataSource: NetworkCharacterDataSourceImpl()))) {
        self.getAllCharactersUseCase = getCharactersUseCase
    }
    
    func getCharactersList() async {
        let charactersList = await getAllCharactersUseCase.fetchAllCharacters()
        await MainActor.run {
            characters.self = charactersList
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
