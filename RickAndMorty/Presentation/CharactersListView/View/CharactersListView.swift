//
//  CharactersListView.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import SwiftUI

struct CharactersListView: View {
    
    @EnvironmentObject private var viewModel: CharactersListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.characters) { character in
                    Section {
                        CharacterCard(image: character.imageURL, name: character.name)
                    }
                }
            }.task {
                await viewModel.getCharacters()
            }
            .navigationTitle("Characters")
        }
    }
}

#Preview {
    CharactersListView()
}
