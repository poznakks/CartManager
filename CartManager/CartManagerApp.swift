//
//  CartManagerApp.swift
//  CartManager
//
//  Created by Vlad Boguzh on 30.08.2024.
//

import SwiftUI

@main
struct CartManagerApp: App {

    @State private var cartManager: CartManager
    @State private var catalogueViewModel: CatalogueViewModel
    @State private var cartViewModel: CartViewModel

    init() {
        let cartManager = CartManager()
        _cartManager = State(wrappedValue: cartManager)
        _catalogueViewModel = State(wrappedValue: CatalogueViewModel(cartManager: cartManager))
        _cartViewModel = State(wrappedValue: CartViewModel(cartManager: cartManager))
    }

    var body: some Scene {
        WindowGroup {
            RootView(
                catalogueViewModel: catalogueViewModel,
                cartViewModel: cartViewModel,
                cartManager: cartManager
            )
        }
    }
}
