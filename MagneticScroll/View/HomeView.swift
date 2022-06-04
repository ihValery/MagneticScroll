//
//  HomeView.swift
//  MagneticScroll
//
//  Created by Валерий Игнатьев on 4.06.22.
//

import SwiftUI

//MARK: - HomeView

struct HomeView: View {
    
    //MARK: Properties
    
    @ObservedObject private var cardVM = CardVM()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 300) {
                ForEach(cardVM.cards) { card in
                    GeometryReader { grProxy in
                        OneCardView(300,
                                    card.color,
                                    "\(Int(grProxy.frame(in: .global).minX))")
                    }
                }
            }
        }
        .frame(height: 250)
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
