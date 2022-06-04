//
//  CardVM.swift
//  MagneticScroll
//
//  Created by Валерий Игнатьев on 4.06.22.
//

import SwiftUI

//MARK: - CardVM

final class CardVM: ObservableObject {
    
    //MARK: Properties
    
    @Published var cards: [CardModel] = []
    
    //MARK: Initializer
    
    init() {
        cards = [
            CardModel(.red), CardModel(.orange), CardModel(.yellow), CardModel(.green), CardModel(.cyan), CardModel(.blue), CardModel(.purple)
        ]
    }
}
