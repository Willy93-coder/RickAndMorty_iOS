//
//  CharactersDataSourceImpl.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation
import Alamofire

struct CharacterDataSourceImpl: CharacterDataSource {
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
