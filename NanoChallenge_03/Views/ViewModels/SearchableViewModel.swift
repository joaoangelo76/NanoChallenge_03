//
//  SearchableViewModel.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 28/08/23.
//

import Foundation
import Combine

@MainActor
class SearchableViewModel: ObservableObject {
    
    @Published private(set) var allGames: [Game] = []
    @Published private(set) var filteredGames: [Game] = []
    @Published var searchableText: String = ""
    
    // Combine Stuff
    private var cancellabes = Set<AnyCancellable>()
    let provider = GameProvider()
    
    var isSearching: Bool {
        !searchableText.isEmpty
    }
    
    init() {
        addSubscribers()
    }
// MARK: Functions
    func loadGames() async {
        
        do {
            allGames = try await provider.getGames()
            print("\n\n\n\nGames Count: \(allGames.count)")
        } catch {
            print(error)
        }
    }
    
    private func addSubscribers() {
        
       $searchableText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] searchableText in
                self?.filterRestaurant(searchableTxt: searchableText)
            }
            .store(in: &cancellabes)
    }
    
    private func filterRestaurant(searchableTxt: String) {
        
        guard !searchableTxt.isEmpty else {
            filteredGames = []
            return
        }
        
        let search = searchableTxt.lowercased()
        filteredGames = allGames.filter({ game in
            let titleContainsSearch = game.title.lowercased().contains(search)
            
            return titleContainsSearch
        })
    }
}


