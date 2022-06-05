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
    
    @ObservedObject private var cardVM = PantoneVM()
    
    @GestureState private var dragOffset: CGFloat = .zero
    
    @State private var currentIndex: Int = 3
    
    private var cards: [PantoneModel] {
        cardVM.palette
    }
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Цветовая палитра Лондон")
                .font(.title)
                .bold()
            
            Text("Выглядит более легкой и воздушной, цвета как-будто разбавлены белой краской.")
        }
        .padding()
    }

    //MARK: Body

    var body: some View {
        header
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
