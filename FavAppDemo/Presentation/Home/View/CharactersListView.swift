//
//  CharactersListView.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import SwiftUI

struct CharactersListView: View {
    
    @StateObject private var viewModel = CharactersListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.characters) { character in
                    Section {
                        CharacterRow(image: character.image, name: character.name, gender: character.gender, species: character.species)
                    }
                }
            }.task {
                viewModel.getCharacters()
            }
            .navigationTitle("Characters")
        }
    }
}

#Preview {
    CharactersListView()
}
