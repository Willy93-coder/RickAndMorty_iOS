//
//  CharacterRow.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import SwiftUI

struct CharacterCard: View {
    
    var image: URL?
    var name: String?
    var gender: String?
    var species: String?
    
    var body: some View {
        HStack {
            AsyncImage(url: image) { phase in
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
                Text(name ?? "")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            Spacer()
        }
    }
}

#Preview {
    CharacterCard()
}
