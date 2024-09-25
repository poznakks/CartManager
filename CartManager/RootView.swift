//
//  RootView.swift
//  CartManager
//
//  Created by Vlad Boguzh on 30.08.2024.
//

import SwiftUI

struct RootView: View {

    @StateObject private var cartManager = CartManager()

    var body: some View {
        TabView {
            CatalogueView(
                viewModel: CatalogueViewModel(cartManager: cartManager)
            )
            .tabItem { Label(
                title: { Text("Home") },
                icon: { Image(systemName: "house") }
            )
            }

//            let _ = print("render")

            CartView(
                viewModel: CartViewModel(cartManager: cartManager)
            )
            .tabItem { Label(
                title: { Text("Cart") },
                icon: { Image(systemName: "basket") }
            )
            }
            .badge(cartManager.totalInCart)
        }
    }
}

#Preview {
    RootView()
}
