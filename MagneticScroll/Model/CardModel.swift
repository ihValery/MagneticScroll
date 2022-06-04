//
//  CardModel.swift
//  MagneticScroll
//
//  Created by Валерий Игнатьев on 4.06.22.
//

import SwiftUI

//MARK: - CardModel

struct CardModel: Identifiable {
    
    //MARK: Properties
    
    let id: UUID
    let color: Color
    
    //MARK: Initializer
    
    init(_ color: Color) {
        id = UUID()
        self.color = color
    }
}
