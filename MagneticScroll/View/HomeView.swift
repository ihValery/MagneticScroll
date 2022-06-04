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
        VStack(spacing: 0) {
            header
            
            GeometryReader { outerProxy in
                let cardWidth = outerProxy.size.width - 50
                
                HStack(spacing: 0) {
                    ForEach(cardVM.cards.indices, id: \.self) { index in
                        GeometryReader { innerProxy in
                            OneCardView(cardVM.cards[index].color,
                                        "\(Int(dragOffset))")
                        }
                        .padding(.horizontal, 10)
                        .frame(width: cardWidth, height: heightCurrentCard(index, outerProxy))
                        .offset(x: 25)
                        .offset(x: -(cardWidth) * CGFloat(currentIndex))
                        .offset(x: dragOffset)
                        .gesture(simpleGesture(cardWidth))
                    }
                }
                .frame(width: outerProxy.size.width, height: outerProxy.size.height, alignment: .leading)
                .background(separationCenter(outerProxy))
            }
        }
        .animation(.interpolatingSpring(mass: 0.6, stiffness: 100, damping: 10, initialVelocity: 0.3), value: dragOffset)
    }
    
    private var header: some View {
        VStack(alignment: .trailing, spacing: 0) {
            Text("Скролл с авто центрированием")
                .font(.title)
                .bold()
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Текущий индекс: \(currentIndex)")
        }
        .padding(.bottom)
        .padding(.horizontal)
    }
        
    //MARK: Private Methods
    
    private func heightCurrentCard(_ index: Int,_ outer: GeometryProxy) -> CGFloat {
        let height = outer.size.height
        
        return currentIndex == index ? height : height - 50
    }
    
    private func separationCenter(_ outer: GeometryProxy) -> some View {
        Rectangle()
            .fill(.gray)
            .frame(width: 1, height: outer.size.height + 20)
    }

    private func simpleGesture(_ cardWidth: CGFloat) -> some Gesture {
        DragGesture()
            .updating($dragOffset) { value, state, transaction in
                state = value.translation.width
            }
            .onEnded { value in
                let threshold = cardWidth * 0.5
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
