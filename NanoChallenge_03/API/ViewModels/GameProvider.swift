//
//  GameProvider.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import Foundation

class GameProvider: ObservableObject {
    
    @Published var gamesArray:[Game] = []
    
    func getGames() async throws -> [Game]{
        let endpoint = "https://www.freetogame.com/api/games"
        
        guard let url = URL(string: endpoint) else {
            //Error happened because of an invalid URL.
            throw GHError.invalidURL
        }
        //Downloading and pulling the data.
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            //Error happened because of an invalid response.
            throw GHError.invalidResponse
        }
        
        //Convert the JSON into a GameProvider user object.
        do {
            //Using protocol codable do decode the JSON.
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([Game].self, from: data)
        } catch {
            //Error happened because of invalid Data.
            throw GHError.invalidData

        }
    }
    
}
