//
//  PantoneModel.swift
//  MagneticScroll
//
//  Created by Валерий Игнатьев on 4.06.22.
//

import SwiftUI

//MARK: - PantoneModel

struct PantoneModel: Identifiable {
    
    //MARK: Properties
    
    let id: UUID
    let color: Color
    let nameRu: String
    let nameEn: String
    
    //MARK: Initializer
    
    init(_ color: Color,_ nameRu: String,_ nameEn: String) {
        id = UUID()
        self.color = color
        self.nameRu = nameRu
        self.nameEn = nameEn
    }
}
