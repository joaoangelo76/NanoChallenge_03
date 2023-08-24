//
//  DetailView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var coreDataController: CoreDataController
    @Environment(\.dismiss) var dismiss
    var detailedGame: Game?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: detailedGame?.thumbnail ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 450, height: 200)
                    .cornerRadius(20)
            } placeholder: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 450, height: 200)
            }
            Text(detailedGame?.title ?? "\n")
                .bold()
                .italic()
                .padding()
            Text(detailedGame?.shortDescription ?? "\n")
                .padding()
                .frame(height: 20)
            Text(detailedGame?.publisher ?? "")
                .padding()
            Text(detailedGame?.releaseDate ?? "")
                .padding()
            Button {
                addGame()
            } label: {
                Image(systemName: "star")
            }
        }
        .foregroundColor(.black)
    }
    
    func addGame() {
        coreDataController.addGame(id: detailedGame?.id ?? 0, title: detailedGame?.title ?? "", thumbnail: detailedGame?.thumbnail ?? "", gameDescription: detailedGame?.shortDescription ?? "", genre: detailedGame?.genre ?? "", publisher: detailedGame?.publisher ?? "", releaseDate: detailedGame?.releaseDate ?? "")
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
