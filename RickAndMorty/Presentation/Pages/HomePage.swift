//
//  HomePage.swift
//  RickAndMorty
//
//  Created by Willy on 23/10/24.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        TabView {
            Tab("Favourite", systemImage: "medal.star.fill") {
                FavCharactersListView()
            }
            Tab("Characters", systemImage: "list.clipboard.fill") {
                CharactersListView()
            }
        }
    }
}

#Preview {
    HomePage()
}
