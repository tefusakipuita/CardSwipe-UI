//
//  ContentView.swift
//  Card Swipe App
//
//  Created by 中筋淳朗 on 2020/12/15.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    
    @State var cardData = Data.cards
    
    @State var selected = 0
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Background
            Color.bgGradient
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // MARK: - Top Title
                HStack {
                    Text("Selection")
                        .font(.system(size: 36, weight: .regular))
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                } //: HStack
                .foregroundColor(.white)
                .padding()
                .padding(.bottom, 90)
                
                // MARK: - Card View
                ZStack {
                    ForEach(cardData.reversed()) { card in
                        HStack {
                            CardView(card: card)
                                .clipped()
                                .shadow(color: Color.gray.opacity(0.6), radius: 30, x: 14, y: 26)
                                .scaleEffect(min(1 - CGFloat(card.id - selected) * 0.15, 1))
                                .offset(x: (card.id - selected) < 3 ? CGFloat((card.id - selected) * 60) : 60)
                            
                            Spacer()
                        } //: HStack
                        .padding(.leading, 30)
                        .offset(x: card.offset)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    onChange(value: value, card: card)
                                })
                                .onEnded({ value in
                                    onEnded(value: value, card: card)
                                })
                        ) //: gesture
                    } //: ForEach
                } //: ZStack
                
                Spacer()
            } //: VStack
        } //: ZStack
    }
    
    
    // MARK: - Function
    
    func onChange(value: DragGesture.Value, card: Card) {
        let moveX = value.translation.width
        
        withAnimation {
            // 左スワイプ
            if (moveX <= 0 && selected != cardData.count - 1) {
                cardData[card.id].offset = moveX
            }
            // 右スワイプ (すでにスワイプしたカードを戻す)
            else if (moveX > 0 && selected != 0) {
                
                cardData[card.id - 1].offset = -CGFloat.cardWidth - 60 + moveX
            }
        }
    }
    
    func onEnded(value: DragGesture.Value, card: Card) {
        let moveX = value.translation.width
        
        withAnimation {
            // 左スワイプ
            if (moveX <= 0 && selected != cardData.count - 1) {
                // いっぱいスワイプした時
                if moveX <= -100 {
                    cardData[card.id].offset = -CGFloat.cardWidth - 60
                    
                    selected += 1
                }
                // スワイプが小さい時
                else {
                    cardData[card.id].offset = 0
                }
            }
            // 右スワイプ
            else if (moveX > 0 && selected != 0) {
                // 小さいとき
                if moveX <= 180 {
                    cardData[card.id - 1].offset = -CGFloat.cardWidth - 60
                }
                // 大きい時
                else {
                    cardData[card.id - 1].offset = 0
                    
                    selected -= 1
                }
            }
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
