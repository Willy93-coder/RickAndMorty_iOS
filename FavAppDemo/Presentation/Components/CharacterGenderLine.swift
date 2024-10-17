//
//  CharacterGenderLine.swift
//  FavAppDemo
//
//  Created by Willy on 17/10/24.
//

import SwiftUI

struct CharacterGenderLine: View {
    
    var gender: String?
    
    var body: some View {
        HStack {
            Text("Gender: ")
            Text(gender ?? "No Gender")
        }
    }
}

#Preview {
    CharacterGenderLine()
}
