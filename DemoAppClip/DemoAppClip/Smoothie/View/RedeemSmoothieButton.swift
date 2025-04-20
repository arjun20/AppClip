//
//  RedeemSmoothieButton.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//

import SwiftUI

struct RedeemSmoothieButton: View {
    var action: () -> Void
    var height: Double {
        return 45
    }
    
    var body: some View {
        Button(action: action) {
            Text("Redeem Free Smoothie!", comment: "Button to redeem a free smoothie")
                .font(Font.headline.bold())
                .frame(height: height)
                .frame(minWidth: 100, maxWidth: 400)
                .foregroundStyle(.white)
                .background { Color.accentColor }
                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                .contentShape(Rectangle())
        }
        .buttonStyle(.squishable)
    }
}

struct RedeemSmoothieButton_Previews: PreviewProvider {
    static var previews: some View {
        RedeemSmoothieButton(action: {})
            .frame(width: 300)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

