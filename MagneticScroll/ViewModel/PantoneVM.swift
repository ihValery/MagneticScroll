//
//  PantoneVM.swift
//  MagneticScroll
//
//  Created by Валерий Игнатьев on 4.06.22.
//

import SwiftUI

//MARK: - PantoneVM

final class PantoneVM: ObservableObject {
    
    //MARK: Properties
    
    @Published var palette: [PantoneModel] = []
    
    var title: String = "Цветовая палитра Лондон"
    
    var subtitle: String = "Выглядит более легкой и воздушной, цвета как-будто разбавлены белой краской."
    
    //MARK: Initializer
    
    init() {
        palette = [
            PantoneModel(.cascade, "Каскад", "Cascade"),
            PantoneModel(.coralRose, "Коралловый розовый", "Coral Rose"),
            PantoneModel(.superSonic, "Супер соник", "Super Sonic"),
            PantoneModel(.popcorn, "Попкорн", "Popcorn"),
            PantoneModel(.potpourri, "Попуррм", "Potpourri"),
            PantoneModel(.bubblegum, "Жевательная резинка", "Bubblegum"),
            PantoneModel(.fragileSprout, "Хрупкий росток", "FragileSprout"),
            PantoneModel(.sudanBrown, "Судан браун", "Sudan Brown"),
            PantoneModel(.orchidBloom, "Цветение орхидеи", "Orchid Bloom"),
            PantoneModel(.coffeeQuartz, "Кофейный кварц", "Coffee Quartz")
        ]
    }
}
