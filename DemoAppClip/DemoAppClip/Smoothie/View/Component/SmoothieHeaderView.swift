//
//  SmoothieHeaderView.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//

import SwiftUI

struct SmoothieHeaderView: View {
    var smoothie: Smoothie
    var body: some View {
        Group {
            fullBleedContent
        }
        .accessibilityElement(children: .combine)
    }
    
    var fullBleedContent: some View {
        VStack(spacing: 0) {
            smoothie.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .accessibility(hidden: true)
            
            VStack(alignment: .leading) {
                Text(smoothie.description)
                Text(smoothie.energy.formatted(.measurement(width: .wide, usage: .food)))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background()
        }
    }
    
//    var wideClipShape = RoundedRectangle(cornerRadius: 20, style: .continuous)
//    var wideContent: some View {
//        HStack(spacing: 0) {
//            VStack(alignment: .leading, spacing: 4) {
//                #if os(macOS)
//                Text(smoothie.title)
//                    .font(Font.largeTitle.bold())
//                #endif
//                Text(smoothie.description)
//                    .font(.title2)
//                Spacer()
//                Text(smoothie.energy.formatted(.measurement(width: .wide, usage: .asProvided)))
//                    .foregroundStyle(.secondary)
//                    .font(.headline)
//            }
//            .padding()
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//            .background()
//
//            smoothie.image
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 220, height: 250)
//                .clipped()
//                .accessibility(hidden: true)
//        }
//        .frame(height: 250)
//        .clipShape(wideClipShape)
//        .overlay {
//            wideClipShape.strokeBorder(.quaternary, lineWidth: 0.5)
//        }
//        .padding()
//    }
}

struct SmoothieHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SmoothieHeaderView(smoothie: .berryBlue)
    }
}
