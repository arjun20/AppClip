//
//  SmoothieMenu.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//

import SwiftUI

struct SmoothieMenu: View {
    
    var body: some View {
        SmoothieList(smoothies: Smoothie.all())
            .navigationTitle(Text("Menu", comment: "Title of the 'menu' app section showing the menu of available smoothies"))
    }
    
}

struct SmoothieMenu_Previews: PreviewProvider {
    static var previews: some View {
        SmoothieMenu()
            .environmentObject(Model())
    }
}
