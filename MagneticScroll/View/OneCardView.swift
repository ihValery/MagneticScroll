//
//  OneCardView.swift
//  MagneticScroll
//
//  Created by Валерий Игнатьев on 4.06.22.
//

import SwiftUI

//MARK: - OneCardView

struct OneCardView: View {
    
    //MARK: Properties
    
    private let color: Color
    
    private let text: String?

    var body: some View {
        RoundedRectangle(cornerRadius: 13, style: .continuous)
            .fill(color)
            .overlay(header, alignment: .topTrailing)
    }
    
    @ViewBuilder private var header: some View {
        if let text = text {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
        }
    }
    
    //MARK: Initializer
    
    init(_ color: Color,_ text: String? = nil) {
        self.color = color
        self.text = text
    }
}

//MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OneCardView(.green, "104")
    }
}
