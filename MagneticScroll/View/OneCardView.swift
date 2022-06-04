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
    
    private let width: CGFloat
    
    private let height: CGFloat
    
    private let color: Color
    
    private let text: String

    var body: some View {
        RoundedRectangle(cornerRadius: 13, style: .continuous)
            .fill(color)
            .frame(width: width, height: height)
            .overlay(
                Text(text)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                , alignment: .topTrailing
            )
    }
    
    //MARK: Initializer
    
    init(_ width: CGFloat,_ color: Color,_ text: String) {
        self.width = width
        height = width / 1.61
        self.color = color
        self.text = text
    }
}

//MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OneCardView(300, .green, "test")
    }
}
