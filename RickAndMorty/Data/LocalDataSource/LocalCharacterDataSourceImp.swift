//
//  LocalCharacterDataSourceImp.swift
//  RickAndMorty
//
//  Created by Guillermo Cifre on 12/11/24.
//

import Foundation
import SwiftData

class LocalCharacterDataSourceImp: @preconcurrency LocalCharacterDataSourceProtocols {
    static let shared: LocalCharacterDataSourceImp = LocalCharacterDataSourceImp()
    
    @MainActor
    var container: ModelContainer = setupContainer(inMemory: false)
    
    private init() {}
    
    @MainActor
    static func setupContainer(inMemory: Bool) -> ModelContainer {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: inMemory)
        do {
            let container = try ModelContainer(for: FavCharacterId.self, configurations: configuration)
            container.mainContext.autosaveEnabled = true
            return container
        } catch {
            fatalError("Database can't be created")
        }
    }
    
    @MainActor
    func fetchAllFavoriteCharactersId() throws -> [FavCharacterId] {
        let allFavCharactersIdDescriptor = FetchDescriptor<FavCharacterId>()
        guard let allFavCharactersId = try? container.mainContext.fetch(allFavCharactersIdDescriptor) else {
            fatalError("Error getting data from database")
        }
        return allFavCharactersId
    }
    
    @MainActor
    func insertFavoriteCharacterId(_ favCharacterId: FavCharacterId) throws {
        do {
            container.mainContext.insert(favCharacterId)
            try container.mainContext.save()
        } catch {
            fatalError("Error inserting data into database")
        }
    }
    
    @MainActor
    func removeFavoriteCharacterId(_ characterId: Int) throws {
        let characterIdPredicate = #Predicate<FavCharacterId> { $0.favCharacterId == characterId }
        
        var characherIdDescriptor = FetchDescriptor<FavCharacterId>(predicate: characterIdPredicate)
        characherIdDescriptor.fetchLimit = 1
        
        do {
            guard let characterId = try container.mainContext.fetch(characherIdDescriptor).first else { fatalError("Character not exist in database") }
            container.mainContext.delete(characterId)
            try container.mainContext.save()
        } catch {
            fatalError("Error deleting data from database")
        }
    }
    
}
