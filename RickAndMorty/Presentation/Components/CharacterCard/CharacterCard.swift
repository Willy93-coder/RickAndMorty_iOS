//
//  CharacterRow.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import SwiftUI

struct CharacterCard: View {
    
    var character: Character?
    
    var body: some View {
        if let character {
            HStack {
                AsyncImage(url: character.imageURL) { phase in
                    if let image = phase.image {
                        image.resizable()
                    } else if phase.error != nil {
                        Image(systemName: "photo")
                            .font(.title)
                            .foregroundStyle(.secondary)
                    } else {
                        ProgressView()
                            .controlSize(.large)
                    }
                }
                .frame(width: 100, height: 100).cornerRadius(5)
                Spacer()
                VStack {
                    Text(character.name)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                Spacer()
                LikeButton(character: character)
            }
        } else {
            Text("No characters")
        }
    }
}
