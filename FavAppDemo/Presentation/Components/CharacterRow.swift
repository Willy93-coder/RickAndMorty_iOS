//
//  CharacterRow.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import SwiftUI

struct CharacterRow: View {
    
    var image: String?
    var name: String?
    var gender: String?
    var species: String?
    
    var body: some View {
        HStack {
            Image(image ?? "placeholder").frame(width: 100, height: 100).background(Color.gray)
            VStack(alignment: .leading) {
                CharacterNameLine(name: name)
                CharacterGenderLine(gender: gender)
                CharacterSpeciesLine(species: species)
            }
        }
    }
}

#Preview {
    CharacterRow()
}
