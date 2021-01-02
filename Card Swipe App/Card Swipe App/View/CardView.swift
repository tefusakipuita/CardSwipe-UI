//
//  CardView.swift
//  Card Swipe App
//
//  Created by 中筋淳朗 on 2020/12/15.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Property
    
    let card: Card
    
    
    // MARK: - Body
    var body: some View {
        ZStack (alignment: .topLeading) {
            Image(card.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: CGFloat.cardWidth, height: 420)
                .cornerRadius(25)
            
            Text(card.title)
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .light, design: .rounded))
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.bgGradient)
                        .shadow(color: Color.bg1.opacity(0.3), radius: 30, x: 6, y: 16)
                )
                .padding(24)
        } //: ZStack
    }
}

// MARK: - Preview

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
