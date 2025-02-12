//
//  CharactersListView.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import SwiftUI

struct CharactersListView: View {
    
    @EnvironmentObject var viewModel: CharactersListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.characters) { character in
                    Section {
                        CharacterCard(character: character)
                    }
                }
            }
            .navigationTitle("Characters")
        }
    }
}

#Preview {
    CharactersListView()
}
