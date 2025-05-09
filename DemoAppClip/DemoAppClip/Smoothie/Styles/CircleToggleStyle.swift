//
//  CircleToggleStyle.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//

import SwiftUI

struct CircleToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label.hidden()
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .accessibility(label: configuration.isOn ?
                               Text("Checked", comment: "Accessibility label for circular style toggle that is checked (on)") :
                                Text("Unchecked", comment: "Accessibility label for circular style toggle that is unchecked (off)"))
                .foregroundStyle(configuration.isOn ? Color.accentColor : .secondary)
                .imageScale(.large)
                .font(Font.title)
        }
    }
}

extension ToggleStyle where Self == CircleToggleStyle {
    static var circle: CircleToggleStyle {
        CircleToggleStyle()
    }
}
