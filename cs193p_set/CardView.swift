//
//  CardView.swift
//  cs193p_set
//
//  Created by Jeremy Pham on 8/17/22.
//

import SwiftUI

struct CardView: View{
    let card : Card
    
    var body: some View{
        
        GeometryReader(content:  { geometry in
                ZStack{
                    let shape = RoundedRectangle(cornerRadius: 20)
                    shape
                        .fill()
                        .foregroundColor(.white)
                    if card.isChosed{
                        shape
                            .strokeBorder(lineWidth: 7)
                            .foregroundColor(.yellow)
                        
                    }else{
                        shape
                            .strokeBorder(lineWidth: 5)
                    }
                    VStack{
                        ForEach(0..<card.number, id:\.self) {_ in
                            symbol.frame(width: geometry.size.width/2, height: geometry.size.height/6)}
                    }.foregroundColor(cardColor)
                }
        })
    }
    
    private var cardColor: Color{
        switch card.color{
        case "red":
            return .red
        case "blue":
            return .blue
        case "green":
            return .green
        default:
            return .black
        }
    }
    
    @ViewBuilder
    private var symbol: some View {
        switch card.shape{
        case "diamond":
            switch card.shade{
                case "solid":
                Diamond().aspectRatio(1, contentMode: .fit)
                case "striped":
                Diamond().opacity(0.5).aspectRatio(1, contentMode: .fit)
                case "outliner":
                Diamond().stroke(lineWidth: 2).aspectRatio(1, contentMode: .fit)
            default:
                Text("Error")
            }
        
        case "circle":
            switch card.shade{
                case "solid":
                Circle()
                case "striped":
                Circle().opacity(0.5)
                case "outliner":
                Circle().stroke(lineWidth: 2)
            default:
                Text("Error")
            }
            
            
        case "rectangle":
            switch card.shade{
                case "solid":
                Rectangle()
                case "striped":
                Rectangle().opacity(0.5)
                case "outliner":
                Rectangle().stroke(lineWidth: 2)
            default:
                Text("Error")
            }
            
        default:
            Text("Error")
        }
            
    }
    
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = Card(id: 0, isFaceUp: true, isChosed: false, isMatched: false, number: 3, shape: "diamond", color: "red", shade: "outliner")
        CardView(card: card)
    }
}
