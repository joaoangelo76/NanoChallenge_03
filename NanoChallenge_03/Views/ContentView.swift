//
//  ContentView.swift
//  NanoChallenge_03
//
//  Created by João Ângelo on 21/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            GamesListView()
                .tabItem {
                    Image(systemName: "magnifyingglass.circle")
                    Text("Search Games")
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
