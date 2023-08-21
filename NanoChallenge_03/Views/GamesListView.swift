//
//  GamesListView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct GamesListView: View {
    
    @StateObject private var gameProvider = GameProvider()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(0..<gameProvider.gamesArray.count, id: \.self) { index in
                        Text(gameProvider.gamesArray[index].title)
                    }
                }
                
            }
            .task {
                do {
            //colocar user no @State da Content
                    gameProvider.gamesArray = try await gameProvider.getGames()
                } catch GHError.invalidURL {
                    print("innvalid URL")
                } catch GHError.invalidResponse {
                    print("invalid response")
                } catch GHError.invalidData {
                    print("invalid data")
                } catch {
                    print("unexpected error")
                }
            }
            .navigationTitle("Games")
        }
    }
}

struct GamesListView_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView()
    }
}
