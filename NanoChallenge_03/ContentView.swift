//
//  ContentView.swift
//  NanoChallenge_03
//
//  Created by João Ângelo on 21/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "star")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Qualquer coisa")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}