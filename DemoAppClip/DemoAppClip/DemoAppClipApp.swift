//
//  DemoAppClipApp.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//

import SwiftUI

@main
struct DemoAppClipApp: App {
    @StateObject private var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
        .commands {
            SidebarCommands()
            SmoothieCommands(model: model)
        }
    }
}
