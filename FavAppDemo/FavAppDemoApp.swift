//
//  FavAppDemoApp.swift
//  FavAppDemo
//
//  Created by Willy on 16/10/24.
//

import SwiftUI

@main
struct FavAppDemoApp: App {
    
    var charactersListViewModel = CharactersListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(charactersListViewModel)
        }
    }
}
