//
//  CartViewModel.swift
//  CartManager
//
//  Created by Vlad Boguzh on 31.08.2024.
//

import Foundation

@MainActor
@Observable
final class CartViewModel {

    private(set) var products: [Product] = []

    @ObservationIgnored
    private var productViewModels: [Product: ProductViewModel] = [:]

    private let cartManager: CartManager

    init(cartManager: CartManager) {
        self.cartManager = cartManager
        listenToCartItems()
    }

    private func listenToCartItems() {
        observe(\.cartManager.cartItems) { cartItems in
            self.products = cartItems.keys.elements
        }
    }

    func productViewModel(for product: Product) -> ProductViewModel {
        if let viewModel = productViewModels[product] {
            return viewModel
        } else {
            let newViewModel = ProductViewModel(product: product, cartManager: cartManager)
            productViewModels[product] = newViewModel
            return newViewModel
        }
    }

    func onAppear() {
        // implement some logic
    }
}
