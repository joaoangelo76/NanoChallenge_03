//
//  FavoritesView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var coreDataController: CoreDataController
    
    var body: some View {
        List {
            ForEach(coreDataController.savedGames) { game in
                Text((game.title)!)
            }
            .onDelete(perform: coreDataController.deleteUser)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
