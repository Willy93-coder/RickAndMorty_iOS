//
//  LikeButton.swift
//  RickAndMorty
//
//  Created by Willy on 23/10/24.
//

import SwiftUI

struct FavouriteButton: View {
    
    @EnvironmentObject var likeManager: FavouriteManager
    @EnvironmentObject var characterViewModel: CharactersListViewModel
    var character: Character
    
    var body: some View {
        Image(systemName: likeManager.isFavourite(id: character.id) ? "star.fill" : "star")
            .foregroundStyle(.yellow)
            .accessibilityLabel(likeManager.isFavourite(id: character.id) ? "Dislike" : "Like")
            .onTapGesture {
                likeManager.toggleLike(character)
                characterViewModel.updateFavCharactersList(character)
            }
    }
}

