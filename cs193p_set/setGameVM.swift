//
//  deckBuilder.swift
//  cs193p_set
//
//  Created by Jeremy Pham on 8/16/22.
//

import Foundation

class setGameVM: ObservableObject{
    
    @Published private var setModel = buildSetGame()
    
    static func buildSetGame() -> setGameModel{
        setGameModel()
    }
    
    var deck: [Card] {
        return setModel.deckShow
    }
    
    func choose(_ card: Card){
        setModel.choose(card)
    }
    
}




