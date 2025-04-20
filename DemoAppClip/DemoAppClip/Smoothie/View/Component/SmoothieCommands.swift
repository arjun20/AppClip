//
//  SmoothieCommands.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//


import SwiftUI

struct SmoothieCommands: Commands {

    let model: Model

    var body: some Commands {
        CommandMenu(Text("Smoothie", comment: "Menu title for smoothie-related actions")) {
            SmoothieFavoriteButton().environmentObject(model)
                .keyboardShortcut("+", modifiers: [.option, .command])
        }
    }
}
