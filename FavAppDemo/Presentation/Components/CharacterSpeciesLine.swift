//
//  CharacterSpeciesLine.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import SwiftUI

struct CharacterSpeciesLine: View {
    
    var species: String?
    
    var body: some View {
        HStack {
            Text("species: ")
            Text(species ?? "Unknown")
        }
    }
}

#Preview {
    CharacterSpeciesLine()
}
