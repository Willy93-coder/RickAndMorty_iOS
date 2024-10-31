//
//  CharactersDataSourceImpl.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation

struct NetworkCharacterDataSourceImpl: NetworkCharacterDataSource {
    
    let url  = URL(string: "https://rickandmortyapi.com/api/character")!
    
    func fetchAllCharacters() async throws -> [Character] {
        let (data, httpResponse)  = try await URLSession.shared.data(from: url)
        return handleResponse(data: data, httpResponse: httpResponse)
    }
    
    private func handleResponse(data: Data?, httpResponse: URLResponse?) -> [Character] {
        guard
            let data = data,
            let httpResponse = httpResponse as? HTTPURLResponse,
            httpResponse.statusCode == 200 else { return [] }
        
        return decodeData(data: data)
    }
    
    private func decodeData(data: Data) -> [Character] {
        do {
            let decodeData = try JSONDecoder().decode(CharactersList.self, from: data)
            return decodeData.charactersList
        } catch {
            print("Error to decode data: \(error.localizedDescription)")
            return []
        }
    }
}
