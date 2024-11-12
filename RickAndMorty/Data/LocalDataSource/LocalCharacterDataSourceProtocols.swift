//
//  LocalCharacterDataSourceProtocols.swift
//  RickAndMorty
//
//  Created by Guillermo Cifre on 12/11/24.
//

import Foundation

protocol LocalCharacterDataSourceProtocols {
    func fetchAllFavoriteCharactersId() throws -> [FavCharacterId]
    
    func insertFavoriteCharacterId(_ favCharacterId: FavCharacterId) throws
    
    func removeFavoriteCharacterId(_ characterId: Int) throws
}
