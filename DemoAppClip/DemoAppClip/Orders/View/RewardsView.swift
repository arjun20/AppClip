//
//  RewardsView.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//

import SwiftUI
import AuthenticationServices

struct RewardsView: View {
    @EnvironmentObject private var model: Model
    
    var body: some View {
        ZStack {
            RewardsCard(
                totalStamps: model.account?.unspentPoints ?? 0,
                animatedStamps: model.account?.unstampedPoints ?? 0,
                hasAccount: model.hasAccount
            )
            .onDisappear {
                model.clearUnstampedPoints()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        #if EXTENDED_ALL
        .safeAreaInset(edge: .bottom, spacing: 0) {
            VStack(spacing: 0) {
                Divider()
                if !model.hasAccount {
                    SignInWithAppleButton(.signUp, onRequest: { _ in }, onCompletion: model.authorizeUser)
                        .frame(minWidth: 100, maxWidth: 400)
                        .padding(.horizontal, 20)
                        #if os(iOS)
                        .frame(height: 45)
                        #endif
                        .padding(.horizontal, 20)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
            }
            .background(.bar)
        }
        #endif
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BubbleBackground().ignoresSafeArea())
    }
}

struct SmoothieRewards_Previews: PreviewProvider {
    static let dataStore: Model = {
        var dataStore = Model()
        dataStore.createAccount()
        dataStore.orderSmoothie(.thatsBerryBananas)
        dataStore.orderSmoothie(.thatsBerryBananas)
        dataStore.orderSmoothie(.thatsBerryBananas)
        dataStore.orderSmoothie(.thatsBerryBananas)
        return dataStore
    }()
    
    static var previews: some View {
        Group {
            RewardsView()
                .preferredColorScheme(.light)
            RewardsView()
                .preferredColorScheme(.dark)
            RewardsView()
                .environmentObject(Model())
        }
        .environmentObject(dataStore)
    }
}
