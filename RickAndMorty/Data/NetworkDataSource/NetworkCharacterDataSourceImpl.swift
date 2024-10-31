//
//  CharactersDataSourceImpl.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation

struct CharacterDataSourceImpl: CharacterDataSource {
    
    let url  = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character")!)
    func getAllCharacters() async -> [Character] {
        do {
            let response = try await AF.request("https://rickandmortyapi.com/api/character")
                .serializingDecodable(CharactersList.self)
                .value
            return response.charactersList
        } catch {
            print("Error fetching characters: \(error)")
            return []
        }
    }
}
