//
//  DetailView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    var detailedGame: Game?
    
    var body: some View {
        VStack {
            
            Button {
               
                addGame()
            } label: {
                Image(systemName: "star")
            }

            AsyncImage(url: URL(string: detailedGame?.thumbnail ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(0)
            } placeholder: {
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: 170)
            }

            Text(detailedGame?.title ?? "")
            Text(detailedGame?.shortDescription ?? "")
        }

    }
    
    func addGame() {
        CoreDataController().addGame(title: detailedGame?.title ?? "", thumbnail: detailedGame?.thumbnail ?? "", gameDescription: detailedGame?.shortDescription ?? "", genre: detailedGame?.genre ?? "", publisher: detailedGame?.publisher ?? "", releaseDate: detailedGame?.releaseDate ?? "", context: managedObjectContext)
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
