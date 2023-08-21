//
//  NetworkingErrors.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import Foundation


enum GHError: Error {
    
    case invalidURL
    case invalidResponse
    case invalidData
}


/*
 
 .task {
     do {
 //colocar user no @State da Content 
       user = try await getGames()
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

 */
