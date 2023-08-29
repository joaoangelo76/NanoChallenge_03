//
//  FavoritesView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var coreDataController: CoreDataController
    
    init() {
        let appear = UINavigationBarAppearance()

        let atters: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Laira", size: 35)!
        ]

        appear.largeTitleTextAttributes = atters
        appear.titleTextAttributes = atters
        UINavigationBar.appearance().standardAppearance = appear
        UINavigationBar.appearance().compactAppearance = appear
        UINavigationBar.appearance().scrollEdgeAppearance = appear
     }
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(coreDataController.savedGames) { game in
                    Text((game.title) ?? "")
                        .font(.custom("Laira", size: 20))
                }
                .onDelete(perform: coreDataController.deleteUser)
            }
            .padding(.vertical)
            .navigationTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
