//
//  CapsuleButtonStyle.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .dynamicTypeSize(.large)
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .background(in: Capsule())
            .foregroundStyle(Color.accentColor)
            .contentShape(Capsule())
            #if os(iOS)
            .hoverEffect(.lift)
            #endif
    }
}

extension ButtonStyle where Self == CapsuleButtonStyle {
    static var capsule: CapsuleButtonStyle {
        CapsuleButtonStyle()
    }
}
