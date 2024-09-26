//
//  ProductViewModel.swift
//  CartManager
//
//  Created by Vlad Boguzh on 01.09.2024.
//

import Foundation

@MainActor
@Observable
final class ProductViewModel {

    let product: Product
    private(set) var quantityInCart: Int = 0

    private let cartManager: CartManager

    init(product: Product, cartManager: CartManager) {
        self.product = product
        self.cartManager = cartManager
        listenToCartItems()
    }

    private func listenToCartItems() {
        Task {
            for await cartItems in cartManager.$cartItems.values {
                let quantity = cartItems[product] ?? 0
                self.quantityInCart = quantity
            }
        }
    }

    func addProductToCart() {
        cartManager.addProductToCart(product)
    }

    func removeProductFromCart() {
        cartManager.removeProductFromCart(product)
    }

    func increaseProductInCart() {
        cartManager.increaseProductInCart(product)
    }

    func decreaseProductInCart() {
        cartManager.decreaseProductInCart(product)
    }
}
