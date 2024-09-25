//
//  RootView.swift
//  CartManager
//
//  Created by Vlad Boguzh on 30.08.2024.
//

import SwiftUI

struct RootView: View {

    var catalogueViewModel: CatalogueViewModel
    var cartViewModel: CartViewModel
    @ObservedObject var cartManager: CartManager

    var body: some View {
        TabView {
            CatalogueView(viewModel: catalogueViewModel)
            .tabItem { Label(
                title: { Text("Home") },
                icon: { Image(systemName: "house") }
            )
            }

            let _ = print("render RootView")

            CartView(viewModel: cartViewModel)
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
    let cartManager = CartManager()
    RootView(
        catalogueViewModel: CatalogueViewModel(cartManager: cartManager),
        cartViewModel: CartViewModel(cartManager: cartManager),
        cartManager: cartManager
    )
}
