//
//  FavoritesView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct FavoritesView: View {
    
    var coreDataController = CoreDataController()
    var body: some View {
        List {
            ForEach(0..<coreDataController.savedGames.count) { index in
                
                Text(coreDataController.savedGames[index].title ?? "")
            }
            
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
