//
//  CardView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct CardView: View {
    
    @State var game: Game?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: game?.thumbnail ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 170)
                    .scaledToFit()
                    .cornerRadius(20)
            } placeholder: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 170)
            }
               
            
            VStack(alignment: .leading) {
                Text(game?.title ?? "")
                    .bold()
                    .lineLimit(1)
                Text(game?.shortDescription ?? "")
                    .font(.caption)
                    .lineLimit(1)
            }
            .padding()
            .frame(width: 170, alignment: .leading)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        .frame(width: 170, height: 250)
        .shadow(radius: 3)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
