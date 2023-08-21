//
//  GamesListView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct GamesListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(0..<10, id: \.self) { index in
                        Rectangle()
                    }
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
