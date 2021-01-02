//
//  Extension.swift
//  Card Swipe App
//
//  Created by 中筋淳朗 on 2020/12/15.
//

import SwiftUI



extension Color {
    
    static let bg1 = Color("bg1")
    static let bg2 = Color("bg2")
    
    static let bgGradient = LinearGradient(gradient: Gradient(colors: [Color.bg1, Color.bg2]), startPoint: .topLeading, endPoint: .bottomTrailing)
}


extension CGFloat {
    
    static let cardWidth = UIScreen.main.bounds.width - 140
}
