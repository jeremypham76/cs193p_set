//
//  setCard.swift
//  cs193p_set
//
//  Created by Jeremy Pham on 8/15/22.
//

import SwiftUI


struct setCardView: View {
    @ObservedObject var gameVM = setGameVM()
    
    var body: some View {
        VStack{
            AspectVGrid(items: gameVM.deck, aspectRatio: 2/3, content: {card in
                CardView(card: card)
                    .padding(5)
                    .onTapGesture {
                        gameVM.choose(card)
                    }
            })
        }
    }
}




struct setCard_Previews: PreviewProvider {
    static var previews: some View {
        let game = setGameVM()
        setCardView(gameVM: game)
    }
}

