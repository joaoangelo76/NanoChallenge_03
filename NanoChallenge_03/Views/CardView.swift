//
//  CardView.swift
//  NanoChallenge_03
//
//  Created by Mateus Martins Pires on 21/08/23.
//

import SwiftUI

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct CardView: View {
    
    @State var game: Game?
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: game?.thumbnail ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(radius: 10.0, corners: [.topLeft, .topRight])

            } placeholder: {
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: 170)
                    .cornerRadius(radius: 10.0, corners: [.topLeft, .topRight])
            }
            VStack(alignment: .leading) {
                Text(game?.title ?? "")
                    .bold()
                    .font(.custom("Laira", size: 20))
                    .tracking(0.5)
                    .foregroundColor(.white)
                    .lineLimit(1)
                Text(game?.shortDescription ?? "")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
            .padding()
            .frame(width: 170, alignment: .leading)
            .background(.black)
        }
        .cornerRadius(radius: 10.0, corners: [.bottomLeft, .bottomRight])
        .frame(width: 170)
        .padding()
        .shadow(radius: 3)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
