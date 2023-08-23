//
//  CoreDataController.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import Foundation
import CoreData

class CoreDataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataModel")
    
    @Published var savedGames: [PersistedGame] = []
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error{
                print("Error \(error.localizedDescription), unable to load data")
            }
        }
        fetchGames()
    }
    
    func fetchGames(){
        let fetch = NSFetchRequest<PersistedGame>(entityName: "PersistedGame")
        
        do {
            savedGames = try container.viewContext.fetch(fetch)
        } catch let error {
            print("Error fetching games - \(error.localizedDescription)")
            }
        }
    
    func save(){
        do{
            try container.viewContext.save()
        } catch {
            print("Error saving, try checking your storage")
        }
        fetchGames()
    }
    
    func addGame(id: Int, title: String, thumbnail: String, gameDescription: String, genre: String, publisher: String, releaseDate: String){
        let game = PersistedGame(context: container.viewContext)
        
        game.id = Int64(id)
        game.title = title
        game.thumbnail = thumbnail
        game.gameDescription = gameDescription
        game.genre = genre
        game.publisher = publisher
        game.releaseDate = releaseDate
        
        save()
    }
    
    func deleteUser(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedGames[index]
        container.viewContext.delete(entity)
        
        save()
    }
}
