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
    @State private var isClicked: Bool = false
    
    var detailedGame: Game?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: detailedGame?.thumbnail ?? "")) { image in
                image
                    .resizable()
                    .border(Color("DifferentOrange"), width: 3)
                    .cornerRadius(10)
                    .frame(width: 350, height: 200)
            } placeholder: {
                RoundedRectangle(cornerRadius: 10)
                    .border(Color("DifferentOrange"), width: 3)
                    .frame(width: 350, height: 200)
            }
            HStack{
                Text(detailedGame?.title ?? "")
                    .bold()
                    .tracking(0.5)
                    .foregroundColor(.white)
                    .padding()
                    .font(.custom("Laira", size: 30))
                if(isClicked == false){
                    Button {
                        addGame()
                        isClicked = true
                    } label: {
                        Image(systemName: "star")
                            .foregroundColor(.red)
                    }
                }
                else if(isClicked == true){
                    Button {
                        addGame()
                        isClicked = false
                    } label: {
                        Image(systemName: "star.fill")
                            .foregroundColor(.red)
                    }
                }
            }
            Text(detailedGame?.shortDescription ?? "")
                .lineLimit(4)
                .font(.custom("Calibri", size: 20))
                .padding()
                .foregroundColor(.white)
                .frame(height: 20)
            Text(detailedGame?.publisher ?? "")
                .bold()
                .tracking(0.5)
                .font(.custom("Laira", size: 20))
                .padding()
                .foregroundColor(.white)
            Text(detailedGame?.releaseDate ?? "")
                .font(.custom("Laira", size: 20))
                .padding()
                .foregroundColor(.white)
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
