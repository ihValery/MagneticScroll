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
    
    @State private var currentIndex: Int = .zero
    
    @GestureState private var dragOffset: CGFloat = .zero
    
    var body: some View {
        GeometryReader { outerProxy in
            let cardWidth = outerProxy.size.width - 50
            
            HStack(spacing: 0) {
                ForEach(cardVM.cards.indices, id: \.self) { index in
                    GeometryReader { innerProxy in
                        OneCardView(cardVM.cards[index].color,
                                    "\(index)")
                    }
                    .padding(.horizontal, 10)
                    .frame(width: cardWidth, height: outerProxy.size.height - 200)
                    .offset(x: 25)
                    .offset(x: -(cardWidth) * CGFloat(currentIndex))
                    .offset(x: dragOffset)
                    .gesture(simpleGesture(cardWidth))
                }
            }
            .frame(width: outerProxy.size.width, height: outerProxy.size.height, alignment: .leading)
        }
    }
    
    private func simpleGesture(_ cardWidth: CGFloat) -> some Gesture {
        DragGesture()
            .updating($dragOffset) { value, state, transaction in
                state = value.translation.width
            }
            .onEnded { value in
                let threshold = cardWidth * 0.65
                var newIndex = Int(-value.translation.width / threshold) + currentIndex
                
                newIndex = min(max(newIndex, 0), cardVM.cards.count - 1)
                
                currentIndex = newIndex
            }
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
