//
//  FavCharactersListView.swift
//  RickAndMorty
//
//  Created by Willy on 23/10/24.
//

import SwiftUI

struct FavCharactersListView: View {
    
    @EnvironmentObject var viewModel: CharactersListViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.favCharacters.isEmpty {
                    Text("No favourite characters yet!")
                } else {
                    List {
                        ForEach(viewModel.favCharacters) { character in
                            Section {
                                CharacterCard(character: character)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favourite Characters")
        }
    }
}

#Preview {
    FavCharactersListView()
}
