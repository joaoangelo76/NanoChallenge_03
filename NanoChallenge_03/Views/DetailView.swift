//
//  DetailView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var mangedObjContext

    @Environment(\.dismiss) var dismiss
    var detailedGame: Game?
    
    var body: some View {
        VStack {
            
            Button {
                
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
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
