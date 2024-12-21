//
//  ViewExtension.swift
//  UserHub
//
//  Created by Haqim Macbook on 21/12/24.
//

import SwiftUI

extension View {
    func borderVerticalSide(height: CGFloat, color: Color) -> some View {
        self.overlay(
            VStack {
                Rectangle()
                    .frame(height: height)
                    .foregroundColor(color)
                Spacer()
                Rectangle()
                    .frame(height: height)
                    .foregroundColor(color)
            }
        )
    }
    
    func rightBottomShadow(color: Color = .gray, radius: CGFloat = 10, x: CGFloat = 5, y: CGFloat = 5) -> some View {
        self.modifier(RightBottomShadowModifier(color: color, radius: radius, x: x, y: y))
    }
}

struct RightBottomShadowModifier: ViewModifier {
    var color: Color
    var radius: CGFloat
    var x: CGFloat
    var y: CGFloat
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: radius, x: x, y: y) // Apply shadow with customized offset
    }
}

extension Color {
    // Initializer for hex color string
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Remove "#" if present
        if hexSanitized.hasPrefix("#") {
            hexSanitized.removeFirst()
        }
        
        // Default to white if invalid hex string
        if hexSanitized.count != 6 {
            self.init(.white)
            return
        }
        
        // Convert hex string to RGB values
        let scanner = Scanner(string: hexSanitized)
        var hexNumber: UInt64 = 0
        
        // Scan the hex string
        if scanner.scanHexInt64(&hexNumber) {
            let r = Double((hexNumber & 0xFF0000) >> 16) / 255.0
            let g = Double((hexNumber & 0x00FF00) >> 8) / 255.0
            let b = Double(hexNumber & 0x0000FF) / 255.0
            
            self.init(red: r, green: g, blue: b)
        } else {
            self.init(.white)
        }
    }
}
