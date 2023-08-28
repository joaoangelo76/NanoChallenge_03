//
//  GamesListView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct GamesListView: View {
    
    @StateObject private var gameProvider = GameProvider()
    
    @State var game: Game?
    @State private var searchText = ""
    @State private var showingSheet = false
    @State private var selectedGame: Game? = nil
    
    var filteredGames: [Game]{
        guard !searchText.isEmpty else { return gameProvider.gamesArray}
        return gameProvider.gamesArray.filter { $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }

    private let adaptativeColumns = [GridItem(.adaptive(minimum: 150))]
    
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
        NavigationStack {
            VStack (spacing: 5){
                ScrollView {
                    LazyVGrid(columns: adaptativeColumns) {
                        
                        ForEach(0..<filteredGames.count, id: \.self) { index in
                            Button {
                                showingSheet = true
                                selectedGame = gameProvider.gamesArray[index]
                            } label: {
                                CardView(game: gameProvider.gamesArray[index])
                            }
                        }
                    }
                }
            }
            .background(Image("Backpocket").ignoresSafeArea())
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
        .searchable(text: $searchText, prompt: "Search Games")
        .sheet(item: $selectedGame) { game in
            DetailView(detailedGame: game)
        }
    }
}

struct GamesListView_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView()
    }
}
