//
//  FavCharactersIdList.swift
//  RickAndMorty
//
//  Created by Guillermo Cifre on 12/11/24.
//

import Foundation
import SwiftData

@Model
class FavCharactersIdList: Identifiable, Hashable {
    
    @Attribute(.unique)
    var identifier: UUID
    
    var FavCharacterId: Int
    
    init(identifier: UUID = UUID(), FavCharactersIdList: Int) {
        self.identifier = identifier
        self.FavCharacterId = FavCharactersIdList
    }
}
