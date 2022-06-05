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
    
    @ObservedObject private var pantoneVM = PantoneVM()
    
    @GestureState private var dragOffset: CGFloat = .zero
    
    @State private var currentIndex: Int = 2
    
    private var palette: [PantoneModel] {
        pantoneVM.palette
    }
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(pantoneVM.title)
                .font(.title)
                .bold()
            
            Text(pantoneVM.subtitle)
        }
        .padding()
        .padding(.bottom)
        .frame(maxWidth: .infinity)
    }
    
    //MARK: Body

    var body: some View {
        VStack {
            header
            
            GeometryReader { grProxy in
                let widthCard = grProxy.size.width - 200
                
                HStack(spacing: 0) {
                    ForEach(palette.indices, id: \.self) { index in
                        OnePantoneView(palette[index], currentIndex == index)
                            .frame(width: widthCard)
                            .offset(x: -widthCard * CGFloat(currentIndex))
                            .offset(x: 100)
                            .offset(x: dragOffset)
                            .gesture(simpleGesture(widthCard))
                    }
                }
                .animation(.interpolatingSpring(mass: 0.6, stiffness: 100, damping: 10, initialVelocity: 0.3), value: dragOffset)
            }
        }
    }
    
    //MARK: Private Methods

    private func simpleGesture(_ widthCard: CGFloat) -> some Gesture {
        DragGesture(minimumDistance: 1)
            .updating($dragOffset) { value, state, transaction in
                state = value.translation.width
            }
            .onEnded { value in
                let threshold = widthCard * 0.5
                var newIndex = Int(-value.translation.width / threshold) + currentIndex
                
                newIndex = min(max(newIndex, 0), palette.count - 1)
                
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
