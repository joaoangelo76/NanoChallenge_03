//
//  GamesListView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct GamesListView: View {
    
    @StateObject private var gameProvider = GameProvider()
    
    //Instance of class SearchableViewModel
    @StateObject private var searchViewModel = SearchableViewModel()
    
    @State var game: Game?
    @State private var searchText = ""
    @State private var showingSheet = false
    @State private var selectedGame: Game? = nil
    
    let uiscreen = UIScreen.main.bounds
    
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
                        
                        ForEach(searchViewModel.isSearching ?searchViewModel.filteredGames : filteredGames) { game in
                            Button {
                                showingSheet = true
                                selectedGame = game
                            } label: {
                            }
                        }
                    }
                }
                .searchable(text: $searchViewModel.searchableText, prompt: "Search Games")
            }
            .background(Image("Backpocket").ignoresSafeArea())
            Rectangle()
                .fill(LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom))
                .ignoresSafeArea()
                .frame(width: 600, height: 15)
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
                await searchViewModel.loadGames()

            }
            .navigationTitle("Games")
        }
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
