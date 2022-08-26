//
//  setCardModel.swift
//  cs193p_set
//
//  Created by Jeremy Pham on 8/16/22.
//

import Foundation

struct Card: Identifiable, Equatable{
    var id: Int = 0
    var isFaceUp: Bool = true
    var isChosed: Bool = false
    var isMatched: Bool = false
    
    var number: Int = 0
    var shape: String = ""
    var color: String = ""
    var shade: String = ""
    
    
    
    static func intheSameSet(card1: Card, card2: Card, card3: Card) -> Bool {
        let isNumber = (card1.number == card2.number && card1.number == card3.number) ||
            (card1.number != card2.number && card1.number != card3.number && card2.number != card3.number)

        let isShape = (card1.shape == card2.shape && card1.shape == card3.shape) ||
        (card1.shape != card2.shape && card1.shape != card3.shape && card2.shape != card3.shape)

        let isShade = (card1.shade == card2.shade && card1.shade == card3.shade) ||
        (card1.shade != card2.shade && card1.shade != card3.shade && card2.shade != card3.shade)

        let isColor = (card1.color == card2.color && card1.color == card3.color) ||
        (card1.color != card2.color && card1.color != card3.color && card2.color != card3.color)

        return isNumber && isShape && isShade && isColor
            

    }
}








