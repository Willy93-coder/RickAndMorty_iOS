//
//  CharactersListViewModel.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import Foundation

class CharactersListViewModel: ObservableObject {
    private var getAllCharactersUseCase: GetAllCharactersFromAPIUseCaseProtocol
    private var getAllCharactersIdFromLocalDatabaseUseCase: GetAllFavCharactersIdFromLocalDatabaseUseCaseProtocol
    private var insertFavCharacterIdIntoLocalDatabaseUseCase: InsertFavCharacterIdIntoLocalDatabaseUseCaseProtocol
    private var removeFavCharacterFromLocalDatabaseUseCase: RemoveFavCharacterFromLocalDatabaseUseCaseProtocol
    
    @Published var characters: [Character] = []
    @Published var favCharacters: [Character] = []
    private var favCharactersId: [Int] = []
    
    init(getCharactersUseCase: GetAllCharactersFromAPIUseCaseProtocol = GetAllCharactersFromAPIUseCase(repository: CharacterRepositoryImpl(networkDataSource: NetworkCharacterDataSourceImpl(), localDataSource: LocalCharacterDataSourceImp.shared)),
         getAllCharactersIdFromLocalDatabaseUseCase: GetAllFavCharactersIdFromLocalDatabaseUseCaseProtocol = GetAllFavCharactersIdFromLocalDatabaseUseCase(repository: CharacterRepositoryImpl(networkDataSource: NetworkCharacterDataSourceImpl(), localDataSource: LocalCharacterDataSourceImp.shared)),
         insertFavCharacterIdIntoLocalDatabaseUseCase: InsertFavCharacterIdIntoLocalDatabaseUseCaseProtocol = InsertFavCharacterIdIntoLocalDatabaseUseCase(repository: CharacterRepositoryImpl(networkDataSource: NetworkCharacterDataSourceImpl(), localDataSource: LocalCharacterDataSourceImp.shared)),
         removeFavCharacterFromLocalDatabaseUseCase: RemoveFavCharacterFromLocalDatabaseUseCaseProtocol = RemoveFavCharacterFromLocalDatabaseUseCase(repository: CharacterRepositoryImpl(networkDataSource: NetworkCharacterDataSourceImpl(), localDataSource: LocalCharacterDataSourceImp.shared))
    ) {
        self.getAllCharactersUseCase = getCharactersUseCase
        self.getAllCharactersIdFromLocalDatabaseUseCase = getAllCharactersIdFromLocalDatabaseUseCase
        self.insertFavCharacterIdIntoLocalDatabaseUseCase = insertFavCharacterIdIntoLocalDatabaseUseCase
        self.removeFavCharacterFromLocalDatabaseUseCase = removeFavCharacterFromLocalDatabaseUseCase
        fectchAllFavCharactersFromLocalDatabase()
        Task {
            await getCharactersList()
            await MainActor.run {
                populateFavCharacters()
            }
        }
    }
    
    func getCharactersList() async {
        let charactersList = await getAllCharactersUseCase.fetchAllCharacters()
        await MainActor.run {
            characters.self = charactersList
        }
    }
    
    func updateFavCharactersList(_ character: Character) {
        if !isFavourite(character.id) {
            addToFavList(character)
            insertFavCharacterIdIntoLocalDatabase(character.id)
            fectchAllFavCharactersFromLocalDatabase()
        } else {
            removeFromFavList(character)
            removeFavCharacterIsFromLocalDatabase(character.id)
            fectchAllFavCharactersFromLocalDatabase()
        }
    }
    
    private func addToFavList(_ character: Character) {
        favCharacters.append(character)
    }
    
    private func removeFromFavList(_ character: Character) {
        favCharacters.removeAll(where: { $0.id == character.id })
    }
    
    private func fectchAllFavCharactersFromLocalDatabase() {
        favCharactersId.self = getAllCharactersIdFromLocalDatabaseUseCase.execute()
    }
    
    private func insertFavCharacterIdIntoLocalDatabase(_ favCharacterId: Int) {
        insertFavCharacterIdIntoLocalDatabaseUseCase.execute(favCharacterId: FavCharacterId(favCharactersId: favCharacterId))
    }
    
    private func removeFavCharacterIsFromLocalDatabase(_ favCharacterId: Int) {
        removeFavCharacterFromLocalDatabaseUseCase.execute(favCharacterId: favCharacterId)
    }
    
    private func populateFavCharacters() {
        if !favCharactersId.isEmpty {
            favCharactersId.forEach { id in
                if let character = characters.first(where: { $0.id == id }) {
                    addToFavList(character)
                }
            }
        }
    }
    
    func isFavourite(_ id: Int) -> Bool {
        return favCharactersId.contains { $0 == id }
    }
}
