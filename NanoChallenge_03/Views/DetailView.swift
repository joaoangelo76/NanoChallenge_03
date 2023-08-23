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
    @State private var favorito: Bool = false
    @State private var nomejogo: String = ""
    var body: some View {
        Form{
            Section{
                //TextField("Nome do jogo", text: $nomejogo)
                Toggle(isOn: $favorito, label: {
                    Text("Favorito")
                        .foregroundColor(.accentColor)
                })
            }
        }
        /*if favorito == true{
            CoreDataController().addGame(title: <#T##String#>, thumbnail: <#T##String#>, gameDescription: <#T##String#>, genre: <#T##String#>, publisher: <#T##String#>, releaseDate: <#T##String#>, context: <#T##NSManagedObjectContext#>)
        }*/
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
