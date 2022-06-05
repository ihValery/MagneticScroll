//
//  OnePantoneView.swift
//  MagneticScroll
//
//  Created by Валерий Игнатьев on 4.06.22.
//

import SwiftUI

//MARK: - OnePantoneView

struct OnePantoneView: View {
    
    //MARK: Properties
    
    private let pantone: PantoneModel
    
    @State private var isSelect: Bool = false
        
    //MARK: Body
    
    var body: some View {
        GeometryReader { grProxy in
            let cardSize = grProxy.size.width
            let cardSizeSmall = cardSize - 36
            
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 13, style: .continuous)
                    .stroke(.gray)
                    .opacity(isSelect ? 1 : 0)
                
                header(cardSize)
                
                RoundedRectangle(cornerRadius: 13, style: .continuous)
                    .fill(pantone.color)
                    .frame(width: cardSizeSmall, height: cardSizeSmall)
                    .padding(.top, isSelect ? nil : 0)
            }
            .frame(width: isSelect ? cardSize : cardSizeSmall,
                   height: isSelect ? cardSize + 50 : cardSizeSmall)
            
            .frame(width: cardSize, height: cardSize + 50, alignment: .top)
            
            .onTapGesture {
                withAnimation(.spring()) {
                    isSelect.toggle()
                }
            }
        }
    }
    
    //MARK: Initializer
    
    init(_ pantone: PantoneModel) {
        self.pantone = pantone
    }
    
    //MARK: Private Methods

    private func header(_ cardSize: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(pantone.nameEn)
                .bold()
            Text(pantone.nameRu)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, isSelect ? 20 : 0)
        .padding(.vertical)
        .offset(y: isSelect ? cardSize - 25 : 0)
    }
}

//MARK: - PreviewProvider

struct OnePantoneView_Previews: PreviewProvider {
    static let pantone = PantoneVM().palette[5]
    
    static var previews: some View {
        OnePantoneView(pantone)
            .frame(width: 200)
            .padding(.top, 50)
    }
}
