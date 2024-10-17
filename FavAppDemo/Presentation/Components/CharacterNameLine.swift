//
//  CharacterNameLine.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import SwiftUI

struct CharacterNameLine: View {
    
    var name: String?
    
    var body: some View {
        HStack {
            Text("Name: ")
            Text(name ?? "No Name")
        }
    }
}

#Preview {
    CharacterNameLine()
}
