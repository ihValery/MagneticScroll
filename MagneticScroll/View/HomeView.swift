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
    
    @State private var currentIndex: Int = 3
    
    @GestureState private var dragOffset: CGFloat = .zero
    
    var body: some View {
        VStack {
            
        }
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
