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

            Button {
                // Verifica se há um ID de jogo disponível
                if let gameID = detailedGame?.id {
                    // Verifica se o jogo já está na lista de favoritos pelo seu ID
                    if let existingIndex = coreDataController.savedGames.firstIndex(where: { $0.id == gameID }) {
                        // Se o jogo já está na lista de favoritos, remove-o
                        coreDataController.deleteUser(indexSet: IndexSet([existingIndex]))
                    } else {
                        // Se o jogo não está na lista de favoritos, adiciona-o
                        addGame()
                    }
                }
            } label: {
                // Verifica se há um ID de jogo disponível para alterar o ícone do botão
                if let gameID = detailedGame?.id {
                    // Altera o ícone do botão para preenchido ("star.fill") se o jogo estiver na lista de favoritos, caso contrário, usa o ícone vazio ("star")
                    Image(systemName: coreDataController.savedGames.contains { $0.id == gameID } ? "star.fill" : "star")
                } else {
                    // Usa o ícone vazio ("star") como padrão se não houver ID de jogo
                    Image(systemName: "star")
                }
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
