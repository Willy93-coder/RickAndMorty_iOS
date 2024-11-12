//
//  LikeButton.swift
//  RickAndMorty
//
//  Created by Willy on 23/10/24.
//

import SwiftUI

struct FavouriteButton: View {
    
    @EnvironmentObject var characterViewModel: CharactersListViewModel
    var character: Character
    
    var body: some View {
        Image(systemName: characterViewModel.isFavourite(character.id) ? "star.fill" : "star")
            .foregroundStyle(.yellow)
            .accessibilityLabel(characterViewModel.isFavourite(character.id) ? "Dislike" : "Like")
            .onTapGesture {
                characterViewModel.updateFavCharactersList(character)
            }
    }
}

