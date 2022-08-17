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
