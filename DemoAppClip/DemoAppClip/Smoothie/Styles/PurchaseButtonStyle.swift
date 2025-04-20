//
//  PurchaseButtonStyle.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//

import SwiftUI

struct PurchaseButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) private var colorScheme
    
    var foregroundColor: Color {
        colorScheme == .dark ? .black : .white
    }
    
    var backgroundColor: Color {
        colorScheme == .dark ? .white : .black
    }
    
    var minWidth: Double {
        return 80
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadline.bold())
            .foregroundStyle(foregroundColor)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(minWidth: minWidth)
            .background(backgroundColor, in: Capsule())
            .contentShape(Capsule())
    }
}

extension ButtonStyle where Self == PurchaseButtonStyle {
    static var purchase: PurchaseButtonStyle {
        PurchaseButtonStyle()
    }
}
