//
//  FavCharactersIdList.swift
//  RickAndMorty
//
//  Created by Guillermo Cifre on 12/11/24.
//

import Foundation
import SwiftData

@Model
class FavCharacterId: Identifiable, Hashable {
    @Attribute(.unique)
    var favCharacterId: Int
    
    init(favCharactersId: Int) {
        self.favCharacterId = favCharactersId
    }
}
