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
            if chosenIndices.count == 3
            {
                if isMatch{
                    ReplaceCards()
                }
                deckShow.indices.forEach{
                    deckShow[$0].isChosed = false
                }
                }
            }
        }
    
    mutating func Add3More(){
        if deckArray.count >= 3{
            for _ in 0..<3{
                deckShow.append(deckArray.popLast()!)
            }
        } else if deckArray.count == 2 {
            for _ in 0..<2{
                deckShow.append(deckArray.popLast()!)
            }
        }else if deckArray.count == 1 {
            deckShow.append(deckArray.popLast()!)
        } else if deckArray.isEmpty{
        }
        
    }
    
    private func isSetInDeck(cards: [Card]) -> Bool{
        for i in 0..<cards.count-2{
            for j in (i+1)..<(cards.count-1){
                for k in (j+1)..<(cards.count){
                    if Card.intheSameSet(card1: cards[i], card2: cards[j], card3: cards[k]){
                        return true
                    }
                }
            }
        }
        return false
    }
    
    //remove the bigger indexes first, otherwise the deckShow get messed up
    private mutating func ReplaceCards() {
        chosenIndices.reversed().forEach({i in
            deckShow.remove(at: i)
        })
        
    }
    
    
    private var isMatch: Bool {
        get{
            if chosenIndices.count == 3{
                  return Card.intheSameSet(card1: deckShow[chosenIndices[0]], card2:deckShow[chosenIndices[1]], card3: deckShow[chosenIndices[2]])
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
        for _ in 0..<4{
            deckShow.append(deckArray.popLast()!)
        }
        
        //make sure when created, the deck will always have a set
        while (isSetInDeck(cards: deckShow) == false){
            Add3More()
        }
    }
}

