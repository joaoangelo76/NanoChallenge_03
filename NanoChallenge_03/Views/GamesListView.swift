//
//  GamesListView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct GamesListView: View {
    
    @StateObject private var gameProvider = GameProvider()
    
    @State var showingSheet = false
    private let adaptativeColumns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 50){
                ScrollView {
                    LazyVGrid(columns: adaptativeColumns) {
                        
                        ForEach(0..<gameProvider.gamesArray.count, id: \.self) { index in
                            NavigationLink {
                                DetailView(detailedGame: gameProvider.gamesArray[index])
                            } label: {
                                CardView(game: gameProvider.gamesArray[index])
                            }
                        }
                    }
                }
                
            }
            .padding(.horizontal)
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
//        .sheet(isPresented: $showingSheet) {
//            DetailView(detailedGame: gameProvider.gamesArray[index])
//        }
    }
}

struct GamesListView_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView()
    }
}
