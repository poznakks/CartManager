//
//  RootView.swift
//  CartManager
//
//  Created by Vlad Boguzh on 30.08.2024.
//

import SwiftUI

struct RootView: View {

    let catalogueViewModel: CatalogueViewModel
    let cartViewModel: CartViewModel
    let cartManager: CartManager

    var body: some View {
        TabView {
            CatalogueView(viewModel: catalogueViewModel)
            .tabItem { Label(
                title: { Text("Home") },
                icon: { Image(systemName: "house") }
            )
            }

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
