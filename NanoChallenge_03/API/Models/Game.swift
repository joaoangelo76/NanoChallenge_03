//
//  Game.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import Foundation

struct Game: Codable, Identifiable {
    
    let id: Int
    let title: String
    let thumbnail: String
    let shortDescription: String
    let genre: String
    let publisher: String
    let releaseDate: String
    
}

