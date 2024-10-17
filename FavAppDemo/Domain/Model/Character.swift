//
//  Character.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import Foundation

struct Character: Decodable ,Identifiable {
    var id: Int
    var name: String
    var image: String
    var species: String
    var gender: String
    var created: String
    
    var imageURL: URL {
        URL(string: image)!
    }
}
