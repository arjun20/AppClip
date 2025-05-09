//
//  SmoothieList.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//

import SwiftUI

struct SmoothieList: View {
    var smoothies: [Smoothie]

    @EnvironmentObject private var model: Model
    
    var listedSmoothies: [Smoothie] {
        smoothies
            .filter { $0.matches(model.searchString) }
            .sorted(by: { $0.title.localizedCompare($1.title) == .orderedAscending })
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            List {
                ForEach(listedSmoothies) { smoothie in
                    NavigationLink(tag: smoothie.id, selection: $model.selectedSmoothieID) {
                        SmoothieView(smoothie: smoothie)
                    } label: {
                        SmoothieRow(smoothie: smoothie)
                    }
                    .onChange(of: model.selectedSmoothieID) { newValue in
                        // Need to make sure the Smoothie exists.
                        guard let smoothieID = newValue, let smoothie = Smoothie(for: smoothieID) else { return }
                        proxy.scrollTo(smoothie.id)
                        model.selectedSmoothieID = smoothie.id
                    }
                    .swipeActions {
                        Button {
                            withAnimation {
                                model.toggleFavorite(smoothieID: smoothie.id)
                            }
                        } label: {
                            Label {
                                Text("Favorite", comment: "Swipe action button in smoothie list")
                            } icon: {
                                Image(systemName: "heart")
                            }
                        }
                        .tint(.accentColor)
                    }
                }
            }
            .accessibilityRotor("Smoothies", entries: smoothies, entryLabel: \.title)
            .accessibilityRotor("Favorite Smoothies", entries: smoothies.filter { model.isFavorite(smoothie: $0) }, entryLabel: \.title)
            .searchable(text: $model.searchString) {
                ForEach(model.searchSuggestions) { suggestion in
                    Text(suggestion.name).searchCompletion(suggestion.name)
                }
            }
        }
    }
}

struct SmoothieList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([ColorScheme.light, .dark], id: \.self) { scheme in
            NavigationView {
                SmoothieList(smoothies: Smoothie.all())
                    .navigationTitle(Text("Smoothies", comment: "Navigation title for the full list of smoothies"))
                    .environmentObject(Model())
            }
            .preferredColorScheme(scheme)
        }
    }
}
