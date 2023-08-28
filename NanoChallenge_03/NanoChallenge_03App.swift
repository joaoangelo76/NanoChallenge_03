//
//  NanoChallenge_03App.swift
//  NanoChallenge_03
//
//  Created by João Ângelo on 21/08/23.
//

import SwiftUI

@main
struct NanoChallenge_03App: App {
    @StateObject private var coreDataControler = CoreDataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coreDataControler)
                .preferredColorScheme(.dark)
        }
    }
}
