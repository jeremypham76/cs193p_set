//
//  setGameModel.swift
//  cs193p_set
//
//  Created by Jeremy Pham on 8/16/22.
//

import Foundation

struct setGameModel{
    private(set) var deckArray: [Card]
    
    private(set) var deckShow: [Card]
    
    private var firstPickIndex, secondPickIndex: Int?
    
    mutating func choose( _ card: Card){
        
        if let currentChosen = deckShow.firstIndex(where: {$0.id == card.id})
        {
            deckShow[currentChosen].isChosed.toggle()
            print(chosenIndices)
            if chosenIndices.count == 3, isMatch
            {
                deckShow[chosenIndices[0]].isFaceUp.toggle()
                deckShow[chosenIndices[1]].isFaceUp.toggle()
                deckShow[chosenIndices[2]].isFaceUp.toggle()
            }
            else {
                 print("keep going")
            }
        }
    }
    
    
    
    
    
    private var isMatch: Bool {
        get{
            if chosenIndices.count == 3{
                let card1 = deckShow[chosenIndices[0]]
                let card2 = deckShow[chosenIndices[1]]
                let card3 = deckShow[chosenIndices[2]]
                
                let isNumber = (card1.number == card2.number && card1.number == card3.number) ||
                    (card1.number != card2.number && card1.number != card3.number && card2.number != card3.number)

                let isShape = (card1.shape == card2.shape && card1.shape == card3.shape) ||
                (card1.shape != card2.shape && card1.shape != card3.shape && card2.shape != card3.shape)

                let isShade = (card1.shade == card2.shade && card1.shade == card3.shade) ||
                (card1.shade != card2.shade && card1.shade != card3.shade && card2.shade != card3.shade)

                let isColor = (card1.color == card2.color && card1.color == card3.color) ||
                (card1.color != card2.color && card1.color != card3.color && card2.color != card3.color)

                return isNumber || isShape || isShade || isColor
                //return Card.intheSameSet(card1: deckShow[chosenIndices[0]], card2:deckShow[chosenIndices[1]], card3: deckShow[chosenIndices[2]])
            }
            else{
                return false
            }
        }
    }
    
    
    private var chosenIndices: [Int]{
        get { deckShow.indices.filter{deckShow[$0].isChosed}}
    }
    
    
    init() {
        deckArray = []
        let numbers = [1,2,3]
        let shapes = ["diamond", "circle", "rectangle"]
        let colors = ["red","blue","green"]
        let shades = ["solid", "outliner", "striped"]
        var idcounter = 1
        for number in numbers.indices{
            for shape in shapes.indices{
                for color in colors.indices{
                    for shade in shades.indices{
                        deckArray.append(Card(id: idcounter,
                                                      number: numbers[number],
                                                      shape: shapes[shape],
                                                      color: colors[color],
                                                      shade: shades[shade]))
                        idcounter += 1
                    }
                }
            }
        }
        deckArray = deckArray.shuffled()
        
        deckShow = []
        for _ in 0..<20{
            deckShow.append(deckArray.popLast()!)
        }
    }
}

