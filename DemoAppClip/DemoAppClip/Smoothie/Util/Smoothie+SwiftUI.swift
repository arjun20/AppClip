//
//  Smoothie+SwiftUI.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//

import SwiftUI

// MARK: - SwiftUI.Image
extension Smoothie {
    var image: Image {
        Image("smoothie/\(id)", label: Text(title))
            .renderingMode(.original)
    }
}
